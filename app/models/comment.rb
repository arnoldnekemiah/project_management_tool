class Comment < ApplicationRecord
  belongs_to :task
  belongs_to :user

  validates :content, presence: true

  after_create_commit :notify_task_assignee

  private

  def notify_task_assignee
    return if user == task.assignee
    # We'll implement notifications later
  end
end
