Given(/^there are the following users:$/) do |table|
  table.hashes.each do |attributes|
    unconfirmed = attributes.delete('unconfirmed') == 'true'
    p attributes
    @user = User.create!(email: attributes[:email], password: attributes[:password])
    @user.update_attribute(:admin, attributes[:admin] == "true")
    @user.confirm! unless unconfirmed
  end
end
