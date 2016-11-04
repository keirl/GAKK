When(/^I go to the homepage$/) do
  visit '/'
end

Then(/^I should fill in my email$/) do
  fill_in 'Email', :with => 'akila1@gmail.com'   
end

Then(/^I should fill in my password$/) do
  fill_in 'Password', :with => 'topsecret' 
end

Then(/^I should fill in my password confirmation$/) do
  fill_in 'Password confirmation', :with => 'topsecret'
end

Then(/^I should click on sign up button$/) do
  click_on("Sign up") 
end

Then(/^I should see Your email address has been successfully confirmed\.$/) do
  has_text?('I should see Your email address has been successfully confirmed.')
end

