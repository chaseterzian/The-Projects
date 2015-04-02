class MembershipsController < PrivateController
  before_action :set_project_params
  before_action :set_membership, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user_for_project
  before_action :user_role_is_owner, only: [:update, :create, :destroy]
  before_action :cant_update_last_owner, only: [:update, :destroy]
  before_action :ensure_admin_owner_or_self, only: [:destroy]

  #check if user is member or owner
  #otherwise kick them out



  def index
    @membership = @project.memberships.new
    @project_owners_count = @project.memberships.where(role: "Owner").count
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
    if @membership.role == "Owner" && @project.memberships.where(role: "Owner").count == 1
      flash[:warning] = "Projects must have at least one owner"
      redirect_to project_memberships_path
    else
      @membership.update(membership_params)
      flash[:message] = "#{@membership.user.full_name} was successfully updated"
      redirect_to project_memberships_path
    end
  end

  def destroy
    @membership.destroy
    flash[:message] = "#{@membership.user.full_name} was successfully removed"
    if @membership.user_id != current_user.id
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

  def set_membership
    @membership = @project.memberships.find(params[:id])
  end

  def cant_update_last_owner
    if @project.memberships.where(role: "Owner").count <= 1 && @membership.role == 'Owner'
      flash[:warning] = "Projects must have at least one owner"
      redirect_to project_memberships_path(@project)
    end
  end





end
