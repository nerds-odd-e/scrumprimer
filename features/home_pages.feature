Feature: Viewer visits the Home Page
 In order to read the page
 As a viewer
 I want to see the home page of scrum primer
  
 Scenario Outline: View home page
  Given I am on the <URL>
  Then I should see <Content>

  Examples:
   | URL 	| Content        |
   | "/"   	| "Scrum Primer" |

   Scenario: View Scrum Primer Logo
    Given I am on the home page
    Then Page should contains "scrumprimerlogo.png"  