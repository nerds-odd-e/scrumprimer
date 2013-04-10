Given(/^I am on the "(.*?)"$/) do |target_url|
  visit target_url
end

Then(/^I should Has Image "(.*?)"$/) do |target_image|    
  page.should have_image target_image
end

Then(/^I should Has Text "(.*?)"$/) do |target_text|
  page.should have_content target_text
end