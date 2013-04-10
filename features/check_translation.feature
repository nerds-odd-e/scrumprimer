Feature: Checking translation link
  In order to read a translation pages
  As a viewer
  I want to see the pages of scrum overview in other languages

  Scenario: Access to chinese scrum overview
    Given I am on the home page
    When I click on '/translation' link
    Then It should show me 'overview/scrum_overview_simplified_chinese.png'

