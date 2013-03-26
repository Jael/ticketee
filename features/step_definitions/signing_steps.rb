Given(/^I am signed in as them$/) do
  steps(%Q{
    And I am on the homepage
    When I follow "Sign in"
    And I fill in "Email" with "user@ticketee.com"
    And I fill in "Password" with "password"
    And I press "Sign in"
    Then I should see "Signed in successfully."
  })
end
Given(/^I am signed in as admin$/) do
  steps(%Q{
    And I am on the homepage
    When I follow "Sign in"
    And I fill in "Email" with "admin@ticketee.com"
    And I fill in "Password" with "password"
    And I press "Sign in"
    Then I should see "Signed in successfully."
  })
end
