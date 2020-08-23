# Given I am on the welcome homepage 
# When I follow Add an Artwork 
# Then I should be X

Feature: Documentation
As a StackOverflow user or visitor
I want to access the documentation section
    
    Scenario: search documentation on Stack Overflow
        Given I am on the welcome homepage
        When I search for "Add an artwork"
        Then I should be fro "Add an artwork"
