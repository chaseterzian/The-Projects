class CommentsController < ApplicationController

  before_action do
    @task = Task.find(params[:task_id])
  end

  def create
    @comment = @task.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to project_task_path(@task.project_id, @task)
    else
      redirect_to project_task_path(@task.project_id, @task)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :task_id, :body, :created_at)
  end

end
