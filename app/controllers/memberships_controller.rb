class MembershipsController < PrivateController
  before_action :set_project_params
  before_action :authorize_user_for_project

  #check if user is member or owner
  #otherwise kick them out

  # before_action :authorize_user_to_delete_membership, only: [:destroy]


  def index
    @membership = @project.memberships.new
  end

  def create
    membership = @project.memberships.new(membership_params)
    if membership.save
      flash[:message] = "#{membership.user.full_name} was successfully added"
      redirect_to project_memberships_path
    else
      @membership = membership
      render :index
    end
  end

  def update
    membership = Membership.find(params[:id])
    if membership.update(membership_params)
      flash[:message] = "#{membership.user.full_name} was successfully updated"
      redirect_to project_memberships_path
    else
      render :index
    end
  end

  def destroy
    membership = @project.memberships.find(params[:id])
    membership.destroy
    flash[:message] = "#{membership.user.full_name} was successfully removed"
    if membership.user_id != current_user.id
      redirect_to project_memberships_path
    else
      redirect_to projects_path
    end
  end

  private

  def membership_params
    params.require(:membership).permit(:user_id, :project_id, :role)
  end

  def set_project_params
    @project = Project.find(params[:project_id])
  end

end
