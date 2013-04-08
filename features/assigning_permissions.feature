Feature: Assigning permissions
  In order to set up users with the correct permissions
  As an admin 
  I want to check all the boxes

  Background:
    Given there are the following users:
      |email|password|admin|
      |admin@ticketee.com|password|true|
      |user@ticketee.com|password|false|
    And there is a state called "Open"
    And I am signed in as admin
    And there is a project called "TextMate2"
    And "user@ticketee.com" has created a ticket for that project:
      |title|description|
      |Shiny!|Eye-blindingly so|
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

  Scenario: Creating tickets for a project
    When I check the "View" for "TextMate2"
    When I check the "Create tickets" for "TextMate2"
    And I press "Update"
    And I follow "Sign out"

    Given I am signed in as them
    When I follow "TextMate2"
    When I follow "New Ticket"
    And I fill in "Title" with "Shiny!"
    And I fill in "Description" with "Make it so!"
    And I press "Create"
    Then I should see "Ticket has been created."

  Scenario: Updating a ticket for a project
    When I check the "View" for "TextMate2"
    And I check the "Edit tickets" for "TextMate2"
    And I press "Update"
    And I follow "Sign out"

    Given I am signed in as them
    When I follow "TextMate2"
    And I follow "Shiny!"
    And I follow "Edit"
    And I fill in "Title" with "Really shiny!"
    And I press "Update Ticket"
    Then I should see "Ticket has been updated."

  Scenario: Deleting a ticket for a project
    When I check the "View" for "TextMate2"
    And I check the "Delete tickets" for "TextMate2"
    And I press "Update"
    And I follow "Sign out"

    Given I am signed in as them
    When I follow "TextMate2"
    And I follow "Shiny!"
    And I follow "Delete"
    Then I should see "Ticket has been deleted."
   Scenario: Changing states for a ticket
    When I check the "View" for "TextMate2"
    And I check the "Change States" for "TextMate2"
    And I press "Update"
    And I follow "Sign out"

    Given I am signed in as them
    When I follow "TextMate2"
    And I follow "Shiny!"
    When I fill in "Text" with "Opening this ticket."
    And I select "Open" from "State"
    And I press "Create Comment"
    Then I should see "Comment has been created."
    And I should see the "Open" within "#ticket .state"
