class ProjectsController < PrivateController
  before_action :set_project_params, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user
  before_action :authorize_user_for_project, except: [:index, :new, :create, :tracker_stories]
  before_action :owner_permission, only: [:edit, :update, :destroy]

  def index
    if current_user.admin == true
      @projects = Project.all
    else
      @projects = current_user.projects
    end
    if current_user.pivitol_tracker_token
      tracker_token = TrackerAPI.new
     if tracker_token.projects(current_user.pivitol_tracker_token)
       @tracker_projects = tracker_token.projects(current_user.pivitol_tracker_token)
     else
       flash[:warning] = 'Invalid Token'
       @tracker_projects = []
     end
   end
  end

  def tracker_stories
    if current_user.pivitol_tracker_token != nil
      @tracker_stories = TrackerAPI.new.stories(current_user.pivitol_tracker_token, params[:project_id])

      @tracker_projects = TrackerAPI.new.projects(current_user.pivitol_tracker_token)
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      Membership.create(
      project_id: @project.id,
      user_id: current_user.id,
      role: "Owner")
      flash[:message] = "Project was successfully created"
      redirect_to project_tasks_path(@project)
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @project.update(project_params)
      flash[:message] = "Project was successfully updated"
      redirect_to project_path
    else
      render :edit
    end
  end

  def destroy
    if @project.destroy
      flash[:message] = "Project was successfully deleted"
      redirect_to projects_path
    else
      render :edit
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :project_id, :user_id, :role, :pivitol_tracker_token)
  end

  def set_project_params
    @project = Project.find(params[:id])
  end
end
# def admin
#   if current_user.admin == true
#     @projects = Project.all
#   end
# end
