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

  # def authorize_user_to_delete_membership
  #   if current_user.project.memberships.include?(@membership)
  #     flash[:message] = "TESTING MEMBERSHIP DELETE OF SELF"
  #   end
  # end

  def user_role_is_owner
    @project.memberships.where(user_id: current_user.id).pluck(:role) == ["Owner"]
  end

  def owner_permission
    if @project.memberships.where(user_id: current_user.id).pluck(:role) == ["Owner"]
    else
      flash[:warning] = "You do not have access"
      redirect_to project_path(@project)
    end
  end

  def user_removal_message
  end


  helper_method :current_user
  helper_method :user_role_is_owner
  helper_method :user_permission?

end
#current_user.memberships.map(&:project_id).include?(project.id)
#project.memberships.map(&:user_id).include?(current_user.id)

# if current_user.projects.where(id: project.id).empty?
# no dice
# unless current_user.projects.where(id: project.id).any?
# also no dice



# @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]  #optimization
