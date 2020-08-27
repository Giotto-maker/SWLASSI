Feature: Itinerary
    As a user 
    So that I can enjoy a visit
    I want to receive an itinerary

Background: 
    Given a registered user

Scenario: External user requests visit suggestion

    Given I am on the home page
    When I follow "visit link"
    Then I should be on the new visit page for non logged in users
    
    And I should see "Enjoy your tour!"
    And I should see "Anfiteatro Flavio"
    And I should see "Giudizio Universale"
    And I should see "Villa Borghese"
    And I should see "Piazza di Spagna"
    And I should see "Vittoriano"
    And I should see "Piazza Navona"
    And I should see "Largo Argentina"

    And I should see "📸 Bring me on itinerary"
    And I should see "Select time to spend to wander"
    And I should see "Weather conditions"
    And I should see "About Us"

    And I should not see "Look for an artwork 🔎"
    And I should not see "Add an artwork 🖼️"
    And I should not see "Contact Us"
    And I should not see "Account"

Scenario: Logged in user requests visit suggestion

    Given a logged in user
    Then I should see "Welcome to smART wandering"
    And I should see "Start visit or come back to your tour! 🗺️"
    When I follow "Start visit or come back to your tour! 🗺️"
    Then I should be on the new visit page for logged in users

    And I should see "Enjoy your tour!"
    And I should see "Auditorium Parco della Musica"
    And I should see "Palazzo di Giustizia"
    And I should see "Palazzetto dello Sport"
    And I should see "Stadio Olimpico"
    And I should see "Palazzo dello Sport"
    And I should see "Basilica di San Giovanni in Laterano"
    And I should see "Basilica di Santa Maria Maggiore"

    And I should see "📸 Bring me on itinerary"
    And I should see "Select time to spend to wander"
    And I should see "Weather conditions"
    And I should see "About Us"

    And I should see "Look for an artwork 🔎"
    And I should see "Add an artwork 🖼️"
    And I should see "Contact Us"
    And I should see "Account"

