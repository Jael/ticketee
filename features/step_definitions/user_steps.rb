Given(/^there are the following users:$/) do |table|
  table.hashes.each do |attributes|
    unconfirmed = attributes.delete('unconfirmed') == 'true'
    p attributes
    @user = User.create!(email: attributes[:email], password: attributes[:password], password_confirmation: attributes[:password_confirmation])
    @user.update_attribute(:admin, attributes[:admin] == "true")
    @user.confirm! unless unconfirmed
  end
end
When(/^I check "(.*?)"$/) do |arg1|
  check arg1
end
#When(/^I press the "(.*?)" with user_id "(.*?)"$/) do |arg1, arg2|
 # click_button arg1
  #User.find(arg2).confirm!
#end
