Feature: Assigning permissions
  In order to set up users with the correct permissions
  As an admin 
  I want to check all the boxes

  Background:
    Given there are the following users:
      |email|password|admin|
      |admin@ticketee.com|password|true|
      |user@ticketee.com|password|false|
    And I am signed in as admin
    And there is a project called "TextMate2"
    When I follow "Admin"
    And I follow "Users"
    And I follow "user@ticketee.com"
    And I follow "Permissions"

  Scenario: Viewing a project
    When I check the "View" for "TextMate2"
    And I press "Update"
    And I follow "Sign out"

    Given I am signed in as them
    Then I should see "TextMate2"

    
