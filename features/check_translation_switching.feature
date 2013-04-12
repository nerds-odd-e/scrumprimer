Feature: Translation Switching
  As a person who prefers to read in a different language other than English
  In order for me to understand the Scrum Primer
  I want to see the page in my preferred language

  Scenario Outline: Switching to Japanese
    Given I am on the home page
    When I click on the <Translation> link
    Then I should see be able to see the word <Text>

  Examples:
    | Translation    |  Text         |    
    |  日本語         |  翻訳         |
    |  简体中文       |  当前版本      |      
