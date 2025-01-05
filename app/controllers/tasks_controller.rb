class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :set_task, except: [:index, :new, :create]

  def index
    @tasks = @project.tasks.includes(:assignee)
    @pagy, @tasks = pagy(@tasks)
  end

  def show
    @comments = @task.comments.includes(:user).order(created_at: :desc)
    @time_entries = @task.time_entries.includes(:user).order(start_time: :desc)
  end

  def new
    @task = @project.tasks.build
  end

  def create
    @task = @project.tasks.build(task_params)

    if @task.save
      respond_to do |format|
        format.html { redirect_to project_task_path(@project, @task), notice: 'Task was successfully created.' }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      respond_to do |format|
        format.html { redirect_to project_task_path(@project, @task), notice: 'Task was successfully updated.' }
        format.turbo_stream
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to project_path(@project), notice: 'Task was successfully deleted.' }
      format.turbo_stream
    end
  end

  private

  def set_project
    @project = current_user.projects.find(params[:project_id])
  end

  def set_task
    @task = @project.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :status, :priority, :due_date, :assignee_id)
  end
end 