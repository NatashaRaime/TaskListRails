class TasksController < ApplicationController

  def index
  @tasks  = Task.all
  end

  def new
    @task = Task.new
  end

  def create
  @task = Task.new(task_params)
  @task.save
  redirect_to @task
  end

  def show
    @task = Task.find(params[:id])

    puts @task
  end
end

private
      def task_params
        params.require(:task).permit(:name, :description, :status, :date)
      end
