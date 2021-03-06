Feature: Editing Projects
  In order to update project information
  As a user
  I want to be able to do that throuhg an interface

  Background: 
    Given there are the following users:
      |email            |password|admin|
      |admin@ticketee.com|password|true|
    And I am signed in as admin
    Given there is a project called "TextMate2"
    And I am on the homepage
    When I follow "TextMate2"
    And I follow "Edit Project"

  Scenario: Updating a project
    And I fill in "Name" with "TextMate2 beta"
    And I press "Update Project"
    Then I should see "Project has been updated."
    Then I should be on the project page for "TextMate2 beta"

  Scenario: Updatig a project with invalid attribute is bad
    And I fill in "Name" with " "
    And I press "Update Project"
    Then I should see "Project has not been updated"

