class TasksController < ApplicationController
  def index
    @task = Task.new
    @tasks = Task.where(parent_task_id: nil)
    @tasks = @tasks.where(status: params[:filter]) if params[:filter].present?
  end

  def show
    @task = Task.new
    @parent_task = Task.find(params[:id])
  end

  def create
    @task = Task.create!(task_params)
    redirect_back(fallback_location: tasks_path)
  end

  def destroy
    @task = Task.find(params[:id])

    if @task.root? && @task.destroy
      redirect_to tasks_path
    else
      redirect_back(fallback_location: tasks_path)
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_back(fallback_location: tasks_path)
  end

  private

  def task_params
    params.require(:task).permit(:title, :parent_task_id, :status, :deadline)
  end
end
