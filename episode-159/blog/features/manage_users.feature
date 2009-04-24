@focus
Feature: Manage Users
  In order to manage user details
  As a security enthusiast
  I want to edit user profiles only when authorized
  
  Scenario Outline: Show or hide edit profile link
    Given the following user records
      | username | password | admin |
      | bob      | secret   | false |
      | admin    | secret   | true  |
    Given I am logged in as "<login>" with password "secret"
    When I visit profile for "<profile>"
    Then I should <action>
    
    Examples:
      | login | profile | action                 |
      | admin | bob     | see "Edit Profile"     |
      | bob   | bob     | see "Edit Profile"     |
      |       | bob     | not see "Edit Profile" |
      | bob   | admin   | not see "Edit Profile" |
