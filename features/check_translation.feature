Feature: Translation Page
  In order to read a scrum primer
  As a foreign people
  I want to see scrum primer in my own language

  Scenario: Default translation language
    Given I am on the home page
    When I go to scrum primer overview translation page
    Then I will see scrum primer overview in simplified_chinese
  
  @javascript
  Scenario: Switch to japanese scrum overview picture
    When I go to japanese picture
    Then I will see scrum primer overview in japanese 

