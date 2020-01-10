@javascript
Feature: Manage comments
  In order to manage comments
  I should be able to manage the comments

  Scenario: Listing comments
    Given I have 3 comments in an article
    When I visit comments page from this article
    Then I should see the list of comments this article
