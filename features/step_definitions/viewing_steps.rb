Given(/^there is a project called "(.*?)"$/) do |name|
  Factory(:project, name: name)
end

Given(/^I am on the homepage$/) do
  visit root_path
end
