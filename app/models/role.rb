class Role < ApplicationRecord
  has_many :project_memberships
  has_many :users, through: :project_memberships
  has_many :projects, through: :project_memberships

  validates :name, presence: true, uniqueness: true
end
