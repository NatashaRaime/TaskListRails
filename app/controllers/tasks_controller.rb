class TasksController < ApplicationController

  def index
  @tasks  = Task.all
  end

  def new
    @task = Task.new
  end



  def show
    @task = Task.find(params[:id])
    puts @task
  end
end

def delete
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path(@task)
end

def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
end

def edit
   @task = Task.find(params[:id])

  if @task.update(task_params)
    redirect_to tasks_path
  else
    render 'edit'
  end
end

def create
@task = Task.new(task_params)
  if @task.save
redirect_to @task
  else
render 'new'
  end
end

def update
   @task = Task.find(params[:id])
   if @task.update(task_params)
     redirect_to @task
  else render 'edit'
   end
end

private
      def task_params
        params.require(:task).permit(:name, :description, :status, :date)
      end
