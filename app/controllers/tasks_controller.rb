class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    # binding.pry
    if @task.save
      redirect_to tasks_path, notice: "You Create Task!!!"
    else
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: "You Edit Task!!!"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice:"You Destroy Tasks!!!!!!"
  end



  private
  def task_params
    params.require(:task).permit(:name, :details)
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
