Given(/^there is a state called "(.*?)"$/) do |name|
  State.create!(name: name)
end

Given(/^I select "(.*?)" from "(.*?)"$/) do |arg1, arg2|
  select arg1, from: arg2
end
When(/^I follow the "(.*?)" for the "(.*?)" state$/) do |link, name|
  state = State.find_by_name(name)
  steps(%Q{When I follow the "#{link}" within "state_#{state.id}" id})
end
