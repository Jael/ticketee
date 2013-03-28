<<<<<<< HEAD
permission_step = /^"(.*?)" can ([^"]*?) ([o|i]n)?\s?the "(.*?)" project$/
  Given permission_step do |user, permission, on, project|
    Permission.create!(user: User.find_by_email!(user), thing: Project.find_by_name!(project), action: permission)
  end


=======
permission_step = /^"(.*?)" can ([^"]*?)([o|i]n)?\s? the "(.*?)" project$/
  Given permission_step do |user, permission, on, project|
  create_permission(user, find_project(project), permission)
  end

  def create_permission(email, object, action)
    Permission.create!(user: User.find_by_email(email), thing: object, action: action)
  end

  def find_project(project)
    Project.find_by_name(project)
  end
>>>>>>> 6ba6e4d2e70eec81a92e2ca8e8a6de3a70f935e3
