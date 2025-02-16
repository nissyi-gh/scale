class TasksController < ApplicationController
  def index
    @task = Task.new
    @tasks = Task.where(parent_task_id: nil)
  end

  def show
    @task = Task.new
    @parent_task = Task.find(params[:id])
  end

  def create
    @task = Task.create!(task_params)
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :parent_task_id)
  end
end
