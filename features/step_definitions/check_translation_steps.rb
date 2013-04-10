Given(/^I am on the home page$/) do
  visit '/'
end

When(/^I go to translation page$/) do
  click_link 'Translations'
end

Then(/^I will see scrum primer in simplified chinese$/) do
  page.should have_image '/overview/scrum_overview_simplified_chinese.png' 
  page.should have_link( "Scrum Overview Version 1", {:href =>"/overview/scrum_overview1_simplified_chinese.pdf" })
  page.should have_link( "Scrum Overview Version 2", {:href =>"/overview/scrum_overview2_simplified_chinese.pdf" })
end

