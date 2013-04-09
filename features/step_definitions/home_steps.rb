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
