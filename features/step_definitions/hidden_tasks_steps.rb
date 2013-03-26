Then(/^I should see the "(.*?)" link$/) do |text|
  page.should(have_css("a", text: text), "Excepcted to see the #{text} link, but did not")
end

Then(/^I should not see the "(.*?)" link$/) do |text|
  page.should_not(have_css("a", text: text), "Excepcted to not see the #{text} link, but did")
end
