class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, except: [:index, :new, :create]
  
  def index
    @projects = current_user.projects.includes(:user)
    @pagy, @projects = pagy(@projects)
  end

  def show
    @tasks = @project.tasks.includes(:assignee)
    @members = @project.project_memberships.includes(:user, :role)
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.owned_projects.build(project_params)
    
    if @project.save
      # Add creator as admin member
      @project.project_memberships.create!(
        user: current_user,
        role: Role.find_by(name: 'Admin')
      )
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Project was successfully deleted.'
  end

  private

  def set_project
    @project = current_user.projects.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :start_date, :end_date, :status)
  end
end 