# encoding: UTF-8
Given(/^I am on the home page$/) do
  visit '/'
end

When(/^I go to scrum primer overview translation page$/) do
  click_link 'Translations'
end

When(/^I go to japanese picture$/) do
  visit '/translations'
  switch_to_japanese  
end

When(/^I go to target picture by click "(.*?)" button$/) do |language_page|
  visit '/translations'
  click_button language_page 
end

Then(/^I will see scrum primer overview in (.*)$/) do |language|
  confirm_scrum_primer_in language
  confirm_download_link language, "1"
  confirm_download_link language, "2"
end

def confirm_scrum_primer_in(language)
  page.should have_image "/overview/#{language}_scrum_overview.png"
end

def confirm_download_link(language, version)
  page.should have_link( "Scrum Overview Version "+version, {:href =>"/overview/#{language}_scrum_overview"+version+".pdf" })
end

def switch_to_japanese
  click_button '日本語' 
end

