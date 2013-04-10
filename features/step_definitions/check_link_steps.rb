Given(/^I am on the "(.*?)"$/) do |arg1|
  visit arg1
end

Then(/^I should Has Image "(.*?)"$/) do |arg1|  
  page.should have_xpath("//img[@src=\"#{arg1}\"]")
end

Then(/^I should Has Text "(.*?)"$/) do |arg1|
  page.should have_content arg1
end