@javascript
Feature: Manage Articles
  In order to manage my Articles
  I should be able to manage the Articles

  Background:
    Given I am a registered user
    And I am logged in

  Scenario: Listing articles
    Given I have 3 articles
    When I visit articles page
    Then I should see the list of articles

  Scenario: Adding a new article
    Given I visit the new articles page
    When I submit a new article
    Then I should see the new book

  Scenario: Updating the title of the article
    Given I have a article
    When I change de title of the article
    Then I should see the article with the new title

  Scenario: Updating the text of the article
    Given I have a article
    When I change de text of the article
    Then I should see the article with the new text

  Scenario: Removing a article
    Given I have a article
    When I remove a article
    Then I should not see it listining anymore
