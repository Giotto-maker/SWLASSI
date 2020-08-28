@javascript
Feature: Add Artwork
    As an artlover
    So that I can introduce an artwork that administrator will complete
    I want to add an artwork to the system specifying name,author and category

    As an administrator
    SO that I can make an artwork fully ready for an itinerary
    I want to add an artwork to the system specifying all the fields

Background: Registration & Login
    Given a registered user
    And a logged in user


Scenario: Add artwork for Base user
    Given I am a base user
    When I follow "Add an artwork 🖼️"
    Then I should see "You need to be an artlover to Add Artworks!"

Scenario: Add artwork for Artlover user
    Given I am an artlover user
    When I follow "Add an artwork 🖼️"
    Then I should be on the add new artwork page
    And I should see "Artlover fields"
    And I should not see "Admin fields"

    And I fill in "name" with "Dipinto di test"
    And I fill in "author" with "Autore di prova"

    And I press "Submit"
    Then the confirmation box should have been displayed
    And I should see "Welcome to smART wandering"

Scenario: Add artwork for Admin user
    Given I am an admin user
    When I follow "Add an artwork 🖼️"
    Then I should be on the add new artwork page
    And I should see "Artlover fields"
    And I should see "Admin fields"

    And I fill in "name" with "Scultura di test"
    And I fill in "author" with "Scultore di test"
    And I fill in "timePeriod" with "Periodo ri test"
    And I fill in "dimensions" with "Dimensioni di test"
    And I fill in "vote" with "Voto di test"
    And I fill in "valutations" with "Valutazioni di test"
    And I fill in "place" with "Indirizzo di test"
    And I fill in "imm1" with "Immagine di test"
    And I fill in "imm2" with "Immagine di test"
    And I fill in "imm3" with "Immagine di test"
    And I fill in "imm4" with "Immagine di test"
    And I fill in "imm5" with "Immagine di test"
    And I fill in "latitude" with "10.0"
    And I fill in "long" with "10.0"

    And I press "Submit"
    Then the confirmation box should have been displayed
    And I should see "Welcome to smART wandering"

