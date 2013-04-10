Given(/^I am on the "(.*?)"$/) do |arg1|
  visit arg1
end

Then(/^I should see "(.*?)"$/) do |arg1|
  page.should have_content arg1
end

Then(/^I should see the image "(.*?)"$/) do |image|
  page.should have_xpath("//img[@src=\"#{image}\"]")
end