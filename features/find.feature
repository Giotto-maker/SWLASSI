@javascript
Feature: Find Artwork
    As an artlover
    So that I can look for an artwork which is in the db
    I want to look for an artwork through name,author and category

    As an administrator
    So that I can look for an artwork which is in the db
    I want to look for an artwork through name,author and category

Background: Registration & Login
    Given a registered user
    And a logged in user
    And an artworks collection


Scenario: Find artwork for Base user
    Given I am a base user
    When I follow "Look for an artwork 🔎"
    Then I should see "You need to be an artlover to look for artworks!"

Scenario: Find artwork for Artlover user
    Given I am an artlover user
    When I follow "Look for an artwork 🔎"
    Then I should be on the look for an artwork page
    And I should see "Fields"

    And I fill in "searchName" with "Vittoriano"

    And I press "Search_btn"
    Then I should be on the page with the list of artworks
    And I should see "🎨 Search results:"

Scenario: Find artwork for Admin user
    Given I am an artlover user
    When I follow "Look for an artwork 🔎"
    Then I should be on the look for an artwork page
    And I should see "Fields"

    And I fill in "searchName" with "Vittoriano"

    And I press "Search_btn"
    Then I should be on the page with the list of artworks
    And I should see "🎨 Search results:"
   
