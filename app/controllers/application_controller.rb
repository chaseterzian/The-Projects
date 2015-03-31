class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_user
    if current_user.present?
    else
      flash[:warning] = "You must sign in"
      redirect_to signin_path
    end
  end

  def current_user
    if session[:user_id].present?
      User.find_by(id: session[:user_id])
    end
  end

  def authorize_user_for_project
    unless current_user.projects.include?(@project)
      flash[:warning] = "You do not have access to that project"
      redirect_to projects_path
    end
  end


  helper_method :current_user

end


# @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]  #optimization
