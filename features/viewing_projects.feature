Feature: Viewing project
  In order to assign tickets to a project
  As a user
  I want to be able to see a list of available projects

  Background:
    Given there are the following users:
      |email            |password|
      |user@ticketee.com|password|
    And I am signed in as them
    Given there is a project called "TextMate2"
    And there is a project called "Internet Explorer"    
    And "user@ticketee.com" can view the "TextMate2" project 

  Scenario: Listing all projects
    And I am on the homepage
    Then I should not see "Internet Explorer"
    When I follow "TextMate2"
    Then I should be on the project page for "TextMate2"
