Given(/^I am on the "(.*?)"$/) do |page_name|
  visit root_path
end
When(/^I follow "(.*?)"$/) do |link_name|
 click_link link_name
end
When(/^I fill in "(.*?)" with "(.*?)"$/) do |name, text|
  fill_in name, with: text
end
When(/^I press "(.*?)"$/) do |button_name|
  click_button button_name
end
Then(/^I should see "(.*?)"$/) do |arg1|
  page.should have_content(arg1)
end
And(/^I should be on the project page for "(.*?)"$/) do |name| 
      project_path(Project.find_by_name!(name))
end


