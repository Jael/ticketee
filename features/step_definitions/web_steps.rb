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

