class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :owned_projects, class_name: 'Project', foreign_key: 'user_id'
  has_many :project_memberships
  has_many :projects, through: :project_memberships
  has_many :assigned_tasks, class_name: 'Task', foreign_key: 'assignee_id'
  has_many :comments
  has_many :time_entries

  validates :first_name, :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
