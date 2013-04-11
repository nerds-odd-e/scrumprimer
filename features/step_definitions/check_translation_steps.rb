# encoding: UTF-8
Given(/^I am on the home page$/) do
  visit '/'
end

When(/^I go to translation page$/) do
  click_link 'Translations'
end

When(/^I go to japanese language page$/) do
  visit '/translations'
  click_button  "日本語"
end

Then(/^I will see scrum primer in (.*)$/) do |language|
  confirm_scrum_primer_in language
  confirm_download_link language, "1"
  confirm_download_link language, "2"
end

def confirm_scrum_primer_in(language)
  page.should have_image '/overview/scrum_overview_'+language+'.png'
end

def confirm_download_link(language, version)
  page.should have_link( "Scrum Overview Version "+version, {:href =>"/overview/scrum_overview"+version+"_"+language+".pdf" })
end

