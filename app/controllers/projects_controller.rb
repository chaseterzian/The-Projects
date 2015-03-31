class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user
  before_action :authorize_user_for_project, except: [:index, :new, :create] #show edit update delete

  def index
    @projects = current_user.projects
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
    params.require(:project).permit(:name, :project_id, :user_id, :role)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end


  #current_user.memberships.map(&:project_id).include?(project.id)
  #project.memberships.map(&:user_id).include?(current_user.id)

    # if current_user.projects.where(id: project.id).empty?
    # no dice
    # unless current_user.projects.where(id: project.id).any?
    # also no dice
