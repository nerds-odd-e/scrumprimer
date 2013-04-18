Feature: Viewer visits the Pages
 In order to read the page
 As a viewer
 I want to see the pages of scrum primer

 Scenario Outline: The Scrum Primer contains the right text at the right place
  Given I am on the <URL>
  Then I should see the text <Text>

  Examples:
   | URL             | Text                                        |
   | "/"             | "Scrum Primer"                              |   
   | "/translations" | "Scrum Primer Translations"                 |
   | "/about"        | "Scrum Primer Creation"                     |
   | "/contact"      | "Feedback and Contributions"                                  |    

 Scenario Outline: The Scrum Primer has the right images
  Given I am on the <URL>
  Then I should see the image <Image>

  Examples:
   | URL             | Image                                       |
   | "/"             | "/logo/en_scrumprimer.png"                      |
   | "/overview"     | "/overview/en_overview.png"                    |
   | "/anime"        | "/overview/anime_scrum_overview_small.png"  |    
