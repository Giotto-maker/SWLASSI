Feature: An user can see Start a visit

Scenario: Start a visit
    Given I am on the smARTwandering welcome page
    When I follow "Start visit or come back to your tour! 🗺️"
    Then I should be on the visit page