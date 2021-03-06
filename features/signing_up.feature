Feature: Signing up
  In order to be attributed for my work
  As a user
  I want to be able to sign up

  Scenario: Signing up
    Given I am on the homepage
    When I follow "Sign up"
    And I fill in "Email" with "user@ticketee.com"
    And I fill in "Password" with "password" 
    And I fill in "Confirmation" with "password"
    And I press "Sign up"
    And "user@ticketee.com" opens the email with subject "Confirmation instructions"
    And they click the first link in the email
    Then I should see "Your account was successfully confirmed."
    And I should see "You are now signed in."
