Feature: Viewer visits the Home Page
 In order to read the page
 As a viewer
 I want to see the home page of scrum primer
  
 Scenario Outline: Menu url
  Given I am on the <URL>
  Then I should see <Content>

  Examples:
   | URL 			| Content        			  |
   | "/"   			| "Scrum Primer" 			  |
   | "/#transation"  | "Scrum Primer Translations" |

   Scenario: View Scrum Primer Logo
    Given I am on the home page
    Then Page should contains "scrumprimerlogo.png"  