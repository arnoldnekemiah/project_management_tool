class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = current_user.projects.active
    @tasks = current_user.assigned_tasks.includes(:project).due_soon
    @recent_activities = Comment.where(task_id: current_user.assigned_tasks.select(:id))
                               .or(Comment.where(user: current_user))
                               .includes(:user, :task)
                               .order(created_at: :desc)
                               .limit(10)
  end
end 