When(/^I go to the homepage$/) do
  visit '/'
end

Then(/^I should fill in my email$/) do
  fill_in 'Email', :with => 'new_user@gmail.com'   
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

Then(/^I should see a login button$/) do
  find_link('Login').visible?
end

Then(/^I should click on the login button$/) do
  click_on("Login")
end

Then(/^I should visit the login page$/) do
  visit new_user_session_path
end

user = FactoryGirl.build(:existing_user)

Then(/^I should fill in email with my email$/) do
  fill_in 'Email', :with => user.email
end

Then(/^I should fill in password with my password$/) do
  fill_in 'Email', :with => user.password
end

Then(/^I should click the login button$/) do
  click_on("Sign in")
end

Then(/^I should see Signed in successfully\.$/) do
  has_text?('Signed in successfully.')
end



