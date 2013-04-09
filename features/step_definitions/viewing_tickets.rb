Given(/^that project has a ticket:$/) do |table|
  table.hashes.each do |attributes|
    @project.tickets.create!(attributes)
  end
end
Given(/^"(.*?)" has created a ticket for that project:$/) do |email, table|
  table.hashes.each do |attributes|
    tags = attributes.delete("tags")
    state = attributes.delete("state")
    ticket = @project.tickets.create!(attributes.merge!(user: User.find_by_email(email)))
    ticket.tag!(tags) if tags
    ticket.state = State.find_or_create_by_name(state) if state
    ticket.save
  end
end
When(/^I attach the file "(.*?)" to "(.*?)"$/) do |path, label|
  attach_file label, path
end
Then(/^I should see the "(.*?)" within "(.*?)"$/) do |content, css|
  page.assert_selector(css, text:content)
end
Then(/^I should not see the "(.*?)" within "(.*?)"$/) do |content, css|
  page.should_not have_css(css, text:content)
end
Given(/^I follow the "(.*?)" within "(.*?)" id$/) do |link, css|
  click_link css
end
Then(/^I should see the page$/) do
  save_and_open_page
end
