class TasksController < ApplicationController

  def index
  @tasks  = Task.all
  end

  def new
    @task = Task.new
  end

  def create
  @task = Task.new(task_params)
    if @task.save
  redirect_to @task
    else
  render 'new'
    end
  end

def destroy
    @task = Task.find(params[:id]).destroy
    redirect_to tasks_path
end

def edit
  @task = Task.find(params[:id])
end

  def show
    @task = Task.find(params[:id])
    puts @task
  end
end

def search
  redirect_to search_path(params[:q])
end

def update
  @task = Task.new(task_params).update
    if @task.update
  redirect_to @task
    else
  render 'edit'
    end
end

private
      def task_params
        params.require(:task).permit(:name, :description, :status, :date)
      end
