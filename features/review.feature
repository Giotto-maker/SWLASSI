Feature: Review feature
    As a base user
    I want to be able to submit a review
    So that I can express my opinion about it

    As an artlover/admin user
    I want to see the list of the reviews for an artwork
    So that I can learn what others think about it

Background: Registration
    Given a registered user
    And an artworks collection

Scenario: Base user review
    Given I am a base user
    And a logged in user
    When I follow "Start visit or come back to your tour! 🗺️"
    Then I should be on the new visit page

    And I should see "Auditorium Parco della Musica"
    When I follow "Auditorium Parco della Musica"
    Then I expect to be on the details page

    And I should see "How was it?"
    And I should see "Leave a comment in the section below:"
    And I should not see "Show reviews"

Scenario: Arlover review
    Given I am an admin user
    And a logged in user
    When I follow "Start visit or come back to your tour! 🗺️"
    Then I should be on the new visit page

    And I should see "Auditorium Parco della Musica"
    When I follow "Auditorium Parco della Musica"
    Then I expect to be on the details page

    And I should see "How was it?"
    And I should see "Leave a comment in the section below:"
    
    When I follow "reviews_link"
    Then I should see "Reviews about Auditorium Parco della Musica"

