Given(/^there is a project called "(.*?)"$/) do |name|
  @project = Factory(:project, name: name)
end

Given(/^I am on the homepage$/) do
  visit root_path
end
Given(/^"(.*?)" can view the "(.*?)" project$/) do |email, project|
  Permission.create!(user: User.find_by_email(email), thing: Project.find_by_name!(project), action: "view")
end
