Given(/^I am on the home page$/) do
 visit "/"
end

Then(/^I should see "(.*?)" in the link$/) do |content|
 page.should have_selector("img[src$='#{scrumprimer.png}']")
end
