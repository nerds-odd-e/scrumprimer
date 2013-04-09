Given(/^I am on the "(.*?)"$/) do |url|
  visit url
end

Then(/^I should see "(.*?)"$/) do |content|
  page.should have_content content
end

Given(/^I am on the home page$/) do
  visit '/'
end

Then(/^Page should contains "(.*?)"$/) do |image|
  page.should have_xpath("//img[@src=\"#{image}\"]")
end

Given(/^I am on the anime page$/) do
  visit '/anime'
end

Then(/^Page should contains a beautiful "(.*?)"$/) do |anime_image|
  page.should have_xpath("//img[@src=\"#{anime_image}\"]")
end

Given(/^I am on the overview page$/) do
  visit '/overview'
end

Then(/^Page should contains a good "(.*?)"$/) do |overview_image|
  page.should have_xpath("//img[@src=\"#{overview_image}\"]")
end


