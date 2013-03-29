permission_step = /^"(.*?)" can ([^"]*?) ([o|i]n)?\s?the "(.*?)" project$/
  Given permission_step do |user, permission, on, project|
    Permission.create!(user: User.find_by_email!(user), thing: Project.find_by_name!(project), action: permission)
  end

When(/^I check the "(.*?)" for "(.*?)"$/) do |permission, name|
  project = Project.find_by_name!(name)
  permission = permission.downcase.gsub(" ", "_")
  field_id = "permissions_#{project.id}_#{permission}"
  steps(%Q{When I check "#{field_id}"})
end




