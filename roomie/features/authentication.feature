# feature/authentication.feature

Feature: Authentication Feature


Scenario: Sign up new user
When I go to the homepage
Then I should fill in my email
Then I should fill in my password
Then I should fill in my password confirmation
Then I should click on sign up button
Then "new_user@gmail.com" should receive an email
When I open the email
Then I should see "Confirmation instructions" in the email subject
Then I should see "Confirm my account" in the email body
When I follow "confirm" in the email
When I click the first link in the email
Then I should see Your email address has been successfully confirmed.

Scenario: An existing user should be able to log in
When I go to the homepage
Then I should see a login button
Then I should click on the login button
Then I should visit the login page
Then I should fill in email with my email
Then I should fill in password with my password
Then I should click the login button
Then I should see Signed in successfully.

Scenario: An existing user should not be able to sign up again
When I go to the homepage
Then I should fill in email with my existing email
Then I should fill in my password with my existing password
Then I should fill in my password confirmation with my existing password
Then I should click on sign up button
Then I should Email has already been taken

Scenario: An non existing user should not be able to sign in
When I go to the homepage
Then I should see a login button
Then I should click on the login button
Then I should visit the login page
Then I should fill in email with an non_existant email
Then I should fill in password with an non_existant password
Then I should click the login button
Then I should see Invalid Email or password.
