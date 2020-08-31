@javascript
Feature: Block an user
    As an administrator
    So that I can protect thr system from malicious users 
    I want to block an user

Background: Registration & Login
    Given a registered user
    And a logged in user

Scenario: Admin cannot block an Admin user
    Given I am an admin user
    When I follow "Users management 👥"
    Then I should be on the users page
    And I should see "luca.andolfi03@gmail.com"
    When I follow "Block"
    Then I should see "You cannot block this user"

Scenario: Admin can block an base user
    Given a registered base user
    Given I am an admin user
    When I follow "Users management 👥"
    Then I should be on the users page
    And I should see "ferrazzivalentina@gmail.com"
    When I follow "Block ferrazzivalentina@gmail.com"
    Then I should see "Welcome to smART wandering"
    When I press "Log out"

