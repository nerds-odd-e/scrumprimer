Feature: Checking translation link
  In order to read a translation pages
  As a viewer
  I want to see the pages of scrum overview in other languages

  Scenario: Access to chinese scrum overview
    Given I am on the home page
    When I click on '/translation' link
    Then It should show me "/overview/scrum_overview_simplified_chinese.png"
      And I should be able to download "/overview/scrum_overview1_simplified_chinese.pdf" from "Scrum Overview Version 1"
      And I also should be able to download "/overview/scrum_overview2_simplified_chinese.pdf" from "Scrum Overview Version 2"

