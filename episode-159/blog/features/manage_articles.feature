Feature: Manage Articles
  In order to make a blog
  As an author
  I want to create and manage articles
  
  Scenario: Articles List
    Given I have articles titled Pizza, Breadsticks
    When I go to the list of articles
    Then I should see "Pizza"
    And I should see "Breadsticks"
  
  Scenario: Create Valid Article
    Given I have no articles
    And I am on the list of articles
    When I follow "New Article"
    And I fill in "Title" with "Spuds"
    And I fill in "Content" with "Delicious potato wedges!"
    And I press "Create"
    Then I should see "New article created."
    And I should see "Spuds"
    And I should see "Delicious potato wedges!"
    And I should have 1 article
