Given(/^I am on the home page$/) do
  visit '/'
end

Then(/^Page should contains a "(.*?)"$/) do |scrumoverview_logo|
  page.should have_xpath("//img[@src=\"#{scrumoverview_logo}\"]")
end

Given(/^I am on the overview page$/) do
  visit '/overview'
end

Then(/^Page should contains a good "(.*?)"$/) do |overview_image|
  page.should have_xpath("//img[@src=\"#{overview_image}\"]")
end

Given(/^I am on the anime page$/) do
  visit '/anime'
end

Then(/^Page should contains a beautiful "(.*?)"$/) do |anime_image|
  page.should have_xpath("//img[@src=\"#{anime_image}\"]")
end

Given(/^I am on the "(.*?)"$/) do |arg1|
  visit arg1
end

Then(/^I should see "(.*?)"$/) do |arg1|
  page.should have_content arg1
end