Feature: Display Products
  In order to purchase the right product
  As a customer
  I want to browse products and see detailed information
  
  Scenario: Show product
    Given a product exists with name: "Milk", price: "2.99"
    When I go to the show page for that product
    Then I should see "Milk" within "h1"
    And I should see "$2.99"
  
  Scenario: List products
    Given the following products exist
      | name   | price |
      | Milk   | 2.99  |
      | Puzzle | 8.99  |
    When I go to path "/products"
    Then I should see products table
      | Milk   | $2.99 |
      | Puzzle | $8.99 |
    Then show me the page

