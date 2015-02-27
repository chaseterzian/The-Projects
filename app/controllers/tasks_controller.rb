class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:created] = "Task was successfully created"##message in application.html.erb
      redirect_to task_path(@task)
    else
      render :new
    end
  end



  def edit
    @task = Task.find(params[:id])
                                      #@name = "Im a stundent"
  end

  def show
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:updated] = "Task was successfully updated"
      redirect_to task_path(@task)  ##removed s togoto show
    else
      render :edit
    end
  end


  def destroy
    Task.destroy(params[:id])
    flash[:deleted] = "Task was successfully deleted"
    redirect_to tasks_path
  end


  private


  def task_params
    params.require(:task).permit(:description, :complete, :duedate)
  end

end
