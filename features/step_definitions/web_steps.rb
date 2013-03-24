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
Then(/^I should see "(.*?)"$/) do |content|
  page.should have_content(content)
end
And(/^I should be on the project page for "(.*?)"$/) do |name| 
  project_path(Project.find_by_name!(name))
end
#Don't know why it say ambigues.
#And(/^I should see "(.*?)"$/) do |content|
 # page.should have_content(content)
#end

