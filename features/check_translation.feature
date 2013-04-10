Feature: Translation Page
  In order to read a scrum primer
  As a foreign people
  I want to see scrum primer in my own language

  Scenario: Default translation language
    Given I am on the home page
    When I go to translation page
    Then I will see scrum primer in simplified chinese

