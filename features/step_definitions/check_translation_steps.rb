Given(/^I am on the home page$/) do
  visit '/'
end

When(/^I click on '\/translation' link$/) do
  click_link 'Translations'
  page.status_code.should == 200
end

Then(/^It should show me "(.*?)"$/) do |chinese_simplify|
   page.should have_image chinese_simplify 
end