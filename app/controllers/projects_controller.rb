class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:message] = "Project was successfully created"
      redirect_to project_path(@project)
    else
      render :new
    end
  end


  def edit
    @project = Project.find(params[:id])
  end

  def show
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash[:message] = "Project was successfully updated"
      redirect_to project_path
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    if @project.destroy
      flash[:message] = "Project was successfully deleted"
      redirect_to projects_path
    else
      render :edit
    end
  end

  private

  def project_params
    params.require(:project).permit(:project_name)
  end


end
