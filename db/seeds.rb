# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create default roles
admin_role = Role.create!(name: 'Admin', description: 'Full access to all projects')
manager_role = Role.create!(name: 'Project Manager', description: 'Can manage assigned projects')
member_role = Role.create!(name: 'Team Member', description: 'Can work on assigned tasks')

# Create admin user
admin = User.create!(
  email: 'admin@example.com',
  password: 'password123',
  first_name: 'Admin',
  last_name: 'User'
)

# Create a sample project
project = Project.create!(
  name: 'Sample Project',
  description: 'This is a sample project',
  status: 'active',
  start_date: Date.today,
  end_date: 1.month.from_now,
  user: admin
)

# Create project membership for admin
ProjectMembership.create!(
  project: project,
  user: admin,
  role: admin_role
)

# Create some sample tasks
task = Task.create!(
  title: 'First Task',
  description: 'This is the first task of the project',
  status: 'todo',
  priority: 1,
  due_date: 1.week.from_now,
  project: project,
  assignee: admin
)

Comment.create!(
  content: 'Initial comment on the task',
  task: task,
  user: admin
)

TimeEntry.create!(
  task: task,
  user: admin,
  start_time: 2.hours.ago,
  end_time: 1.hour.ago,
  description: 'Initial work on the task'
)
