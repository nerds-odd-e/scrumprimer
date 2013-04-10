Given(/^I am on the home page$/) do
  visit '/'
end

When(/^I click on '\/translation' link$/) do
  click_link 'Translations'
  page.status_code.should == 200
end

Then(/^It should show me "(.*?)"$/) do |simplify_chinese|
   page.should have_image simplify_chinese 
end

Then(/^I should be able to download "(.*?)" from "(.*?)"$/) do |pdf_simplify_chinese_v1, url_pdf_simplify_chinese_v1|  
  page.should have_link( url_pdf_simplify_chinese_v1, {:href => pdf_simplify_chinese_v1})
end

Then(/^I also should be able to download "(.*?)" from "(.*?)"$/) do |pdf_simplify_chinese_v2, url_pdf_simplify_chinese_v2|
  page.should have_link( url_pdf_simplify_chinese_v2, {:href => pdf_simplify_chinese_v2})
end