module TasksHelper
  def task_status_color(status)
    case status
    when 'todo'
      'bg-gray-100 text-gray-800'
    when 'in_progress'
      'bg-blue-100 text-blue-800'
    when 'review'
      'bg-yellow-100 text-yellow-800'
    when 'completed'
      'bg-green-100 text-green-800'
    else
      'bg-gray-100 text-gray-800'
    end
  end

  def avatar_url_for(user)
    # You can integrate with Gravatar or use Active Storage here
    "https://ui-avatars.com/api/?name=#{CGI.escape(user.full_name)}&size=32"
  end
end 