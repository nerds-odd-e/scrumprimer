Feature: Viewer visits the Pages
 In order to read the page
 As a viewer
 I want to see the pages of scrum primer

 Scenario Outline: Check resource exists in url
  Given I am on the <URL>
  Then I should <Command> <Resource>

  Examples:
   | URL             | Command   | Resource                                   |
   | "/"             | Has Image | "scrumprimerlogo.png"                      |
   | "/overview"     | Has Image | "overview/overview.png"                    |
   | "/anime"        | Has Image | "overview/anime_scrum_overview_small.png"  |    
   | "/"             | Has Text  | "Scrum Primer"                             |
   | "/translations" | Has Text  | "Scrum Primer Translations"                |
   | "/about"        | Has Text  | "Scrum Primer Creation"                    |
   | "/contact"      | Has Text  | "Feedback"                                 |    
