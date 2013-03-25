Feature: Viewing Ticketing
  In order to view the tickets for a project
  As a user
  I want to see them on the project's page

  Background:
    Given there is a project called "TextMate2"
    And that project has a ticket:
      | title          | description                   |
      | Make it shiny! | Gradients! Starbursts! Oh my! |
    And there is a project called "Internet Explorer"
    And that project has a ticket:
      | title                | description   |
      | standards compliance | Isn't a joke. |
    And I am on the homepage

  Scenario:Viewing tickets on for a given project
    When I follow "TextMate2"
    Then I should see "Make it shiny!"
    And I should not see "standards compliance"
    When I follow "Make it shiny!"
    #  Then I should see "Make it shiny!" within "#ticket h2"
    And I should see "Gradients! Starbursts! Oh my!"

    When I follow "Ticketee"
    And I follow "Internet Explorer"
    Then I should see "standards compliance"
    And I should not see "Make it shiny!"
    When I follow "standards compliance"
    #Then I should see "standards compliance" within "#ticket h2"
    And I should see "Isn't a joke."
