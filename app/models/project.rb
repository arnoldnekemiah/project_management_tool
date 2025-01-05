class Project < ApplicationRecord
  belongs_to :user
  has_many :project_memberships, dependent: :destroy
  has_many :users, through: :project_memberships
  has_many :tasks, dependent: :destroy

  validates :name, presence: true
  validates :status, inclusion: { in: %w[draft active completed archived] }

  scope :active, -> { where(status: 'active') }
  scope :completed, -> { where(status: 'completed') }
end
