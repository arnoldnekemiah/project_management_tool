class Task < ApplicationRecord
  belongs_to :project
  belongs_to :assignee, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :time_entries, dependent: :destroy

  validates :title, presence: true
  validates :status, inclusion: { in: %w[todo in_progress review completed] }
  validates :priority, inclusion: { in: 1..5 }

  scope :todo, -> { where(status: 'todo') }
  scope :in_progress, -> { where(status: 'in_progress') }
  scope :review, -> { where(status: 'review') }
  scope :completed, -> { where(status: 'completed') }
  scope :due_soon, -> { where('due_date <= ?', 7.days.from_now) }
end
