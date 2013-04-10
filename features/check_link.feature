Feature: Viewer visits the Pages
 In order to read the page
 As a viewer
 I want to see the pages of scrum primer

 Scenario Outline: Checking images
  Given I am on the <URL>
  Then I should see the image <Image>

  Examples:
   | URL             | Image                                      |
   | "/"             | "scrumprimerlogo.png"                      |
   | "/overview"     | "overview/overview.png"                    |
   | "/anime"        | "overview/anime_scrum_overview_small.png"  |    

 Scenario Outline: Checking content
  Given I am on the <URL>
  Then I should see <Content>

  Examples:
   | URL             | Content                      |
   | "/"             | "Scrum Primer"               |
   | "/translations" | "Scrum Primer Translations"  |
   | "/about"        | "Scrum Primer Creation"      |
   | "/contact"      | "Feedback"                   |    
