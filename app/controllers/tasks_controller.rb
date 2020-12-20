class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @search_params = task_search_params

    if params[:sort_expired]
      @tasks = Task.all.order(deadline: "DESC")
    elsif params[:sort_priority]
      @tasks = Task.all.order(priority: "DESC")
    else
      @tasks = Task.all.order(created_at: "DESC")
    end

    if params[:task].present?
      @tasks = @tasks.search_with_name(params[:task][:name])
      @tasks = @tasks.search_with_details(params[:task][:details])
      if params[:task][:status].present?
        @tasks = @tasks.search_with_status(params[:task][:status])
      end
    end
   @tasks = @tasks.page(params[:page]).per(5)
  end



  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
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
    params.require(:task).permit(:name, :details, :deadline, :status, :priority)
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_search_params
    params.fetch(:search, {}).permit(:name, :details, :deadline, :status, :priority)
  end
end
