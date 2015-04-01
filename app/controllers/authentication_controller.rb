class AuthenticationController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:message] = "You have successfully signed in"

##
      if session[:request_path]
        redirect_to session[:request_path]
        session[:request_path] = nil
      else
        redirect_to projects_path
      end
##

    else
      @error_message = "Email / Password combination is invalid"
      render :new
    end
  end

  def destroy
    session.clear
    flash[:message] = "You have successfully logged out"
    redirect_to root_path
  end
end
