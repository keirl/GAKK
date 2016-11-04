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

existing_user = FactoryGirl.build(:existing_user)

Then(/^I should fill in email with my email$/) do
  fill_in 'Email', :with => existing_user.email
end

Then(/^I should fill in password with my password$/) do
  fill_in 'Password', :with => existing_user.password
end

Then(/^I should click the login button$/) do
  click_on("Sign in")
end

Then(/^I should see Signed in successfully\.$/) do
  has_text?('Signed in successfully.')
end

#for test 3

Then(/^I should fill in email with my existing email$/) do
  fill_in 'Email', :with => existing_user.email
end

Then(/^I should fill in my password with my existing password$/) do
  fill_in 'Password', :with => existing_user.password
end

Then(/^I should fill in my password confirmation with my existing password$/) do
  fill_in 'Password confirmation', :with => existing_user.password
end

Then(/^I should Email has already been taken$/) do
  has_text?('Email has already been taken.')
end

#for test 4
Then(/^I should fill in email with an non_existant email$/) do
  fill_in 'Email', :with => "non_existant_user@gmail.com"
end

Then(/^I should fill in password with an non_existant password$/) do
  fill_in 'Password', :with => "non_existant_password"
end

Then(/^I should see Invalid Email or password\.$/) do
  has_text?('Invalid Email or password.')
end

unconfirmed_user = FactoryGirl.build(:unconfirmed_user)


#for test 5
Then(/^I should fill in email with an unconfirmed_user email$/) do
  fill_in 'Email', :with => unconfirmed_user.email
end

Then(/^I should fill in password with an unconfirmed_user password$/) do
  fill_in 'Password', :with => unconfirmed_user.password
end

Then(/^I should see You have to confirm your email address before continuing\.$/) do
  has_text?('You have to confirm your email address before continuing.')
end


