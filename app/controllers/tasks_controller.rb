class TasksController < ApplicationController
    before_action :set_task, only: [ :show, :edit, :update, :destroy]
  
    def index
      @tasks = Task.all
    end
  
    def new
      @task = Task.new
    end
  
    def create
      @task = Task.new(task_params)
      if @task.save
        redirect_to tasks_path, notice: "Task has been created successfully."
      else
        render :new
      end
    end
  
    def edit
      @task = Task.find(params[:id])
    end
  
    def update
      if @task.update(task_params)
        redirect_to tasks_path, notice: "Task has been updated successfully."
      else
        render :edit
      end
    end
    def show
      @task = Task.find(params[:id])
    end
  
    def destroy
      if @task.destroy
        redirect_to tasks_path, notice: "Task has been deleted successfully."
      else
        redirect_to tasks_path, alert: "Task could not be deleted."
      end
    end
  
    private
  
    def set_task
      @task = Task.find(params[:id])
    end
  
    def task_params
      params.require(:task).permit(:title, :description, :complete, :due_date)
    end
  end
  