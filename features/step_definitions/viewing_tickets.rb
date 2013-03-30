Given(/^that project has a ticket:$/) do |table|
  table.hashes.each do |attributes|
    @project.tickets.create!(attributes)
  end
end
Given(/^"(.*?)" has created a ticket for that project:$/) do |email, table|
  table.hashes.each do |attributes|
    @project.tickets.create!(attributes.merge!(user: User.find_by_email(email)))
  end
end
When(/^I attach the file "(.*?)" to "(.*?)"$/) do |path, label|
  attach_file label, path
end
Then(/^I should see the "(.*?)" within "(.*?)"$/) do |content, css|
  page.assert_selector(css, text:content)
end
