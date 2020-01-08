@javascript
Feature: Manage Articles
  In order to manage my Articles
  I should be able to manage the Articles

  Scenario: Listing articles
    Given I have 3 articles
    When I visit articles page
    Then I should see the list of articles
