# encoding: UTF-8

Given(/^Given I am on the home page$/) do
  visit '/'	
end	

When(/^I click on the (.*) link$/) do |link|
  click_link link
end

Then(/^I should see be able to see the word (.*)/) do |target_words|
  page.should have_content target_words
end

