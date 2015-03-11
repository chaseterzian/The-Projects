class AuthenticationController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:message] = "You have successfully signed in"
      redirect_to root_path
    else
      @error_message = "Invalid Email/Password"
      render :new
    end
  end

  def destroy
    session.clear
    flash[:message] = "You have successfully logged out"
    redirect_to root_path
  end
end
