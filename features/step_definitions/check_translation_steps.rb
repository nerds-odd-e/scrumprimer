Given(/^I am on the home page$/) do
  visit '/'
end

When(/^I go to translation page$/) do
  click_link 'Translations'
end

Then(/^I will see scrum primer in (.*)$/) do |language|
  page.should have_image '/overview/scrum_overview_'+language+'.png' 
  page.should have_link( "Scrum Overview Version 1", {:href =>"/overview/scrum_overview1_"+language+".pdf" })
  page.should have_link( "Scrum Overview Version 2", {:href =>"/overview/scrum_overview2_"+language+".pdf" })
end

