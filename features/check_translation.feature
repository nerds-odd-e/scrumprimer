Feature: Translation Page
  In order to read a scrum primer
  As a foreign people
  I want to see scrum primer in my own language

  Scenario: Default translation language
    Given I am on the home page
    When I go to scrum primer overview translation page
    Then I will see scrum primer overview in simplified_chinese
  
  @javascript
  Scenario Outline: Switch to <language> scrum overview picture
    When I go to target picture by click <language_page> button
    Then I will see scrum primer overview in <language> 
  
    Examples:
     | language           | language_page |
     | simplified_chinese | "Chinese"     |     
     | vietnamese         | "Vietnamese"  |     
     | japanese           | "Japanese"    |   
     | korean             | "Korean"      |               
     | thai               | "Thai"        |
     | french             | "French"      |
     | german             | "German"      |
     | spanish            | "Spanish"     |
     | bulgarian          | "Bulgarian"   |


        