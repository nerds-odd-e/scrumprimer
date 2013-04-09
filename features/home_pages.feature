Feature: Viewer visits the Pages
 In order to read the page
 As a viewer
 I want to see the pages of scrum primer
  
 Scenario Outline: Menu url
  Given I am on the <URL>
  Then I should see <Content>

  Examples:
   | URL 			 | Content        			   |
   | "/"   			 | "Scrum Primer" 			   |
   | "/translations" | "Scrum Primer Translations"  |
   | "/about"        | "Scrum Primer Creation"      |
   | "/contact"      | "Feedback"                   |   

   Scenario: View Scrum Primer Logo
    Given I am on the home page
    Then Page should contains "scrumprimerlogo.png"  

   Scenario: View Scrum Anime
    Given I am on the anime page
    Then Page should contains a beautiful "overview/anime_scrum_overview_small.png"   

   Scenario: View Scrum Overview
    Given I am on the overview page
    Then Page should contains a good "overview/overview.png"  