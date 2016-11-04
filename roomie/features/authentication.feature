# feature/authentication.feature

Feature: Authentication Feature


Scenario: Sign up new user
When I go to the homepage
Then I should fill in my email
Then I should fill in my password
Then I should fill in my password confirmation
Then I should click on sign up button
Then "akila1@gmail.com" should receive an email
When I open the email
Then I should see "Confirmation instructions" in the email subject
Then I should see "Confirm my account" in the email body
When I follow "confirm" in the email
When I click the first link in the email
Then I should see Your email address has been successfully confirmed.
