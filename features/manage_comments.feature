@javascript
Feature: Manage comments
  In order to manage comments
  I should be able to manage the comments

  Background:
    Given I am a registered user
    And I am logged in

  Scenario: Listing comments
    Given I have 3 comments in an article
    When I visit comments page from this article
    Then I should see the list of comments this article

  Scenario: Adding a new comment
    Given I have an article
    And I visit this article page
    When I submit a new comment
    Then I should see the comment in this article

  Scenario: Removing a comment
    Given I have an article
    And I have a comment in this article
    And I visit this article page
    When I remove a comment
    Then I should not see the comment listining anymore
