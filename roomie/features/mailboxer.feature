# feature/mailboxer.feature

Feature: Mailboxer

Scenario: A user should be able to send a message to a matching user
  Given I am an existing user with a profile and a preference
  Given other users exist with profiles that are similar.
  When I go to the homepage
  Then I should see a login button
  Then I should click on the login button
  Then I should visit the login page
  Then I should fill in the field email with: combined_user_1@gmail.com
  Then I should fill in my field password with: top_secret
  Then I should click the sign in button
  Then I should see Signed in successfully.
  Then I should see the matches button.
  Then I click on matches button.
  Then I should see user combined-username-2
  Then I should see a matching value of 75
  Then I should click on combined username 2
  Then I should see send message to combined username 2
  Then I should see text: "Recipients"
  Then I should see text: "Subject"
  Then I should see text: "Message"
  Then I should select "2" from : "Recipients"
  Then I should fill "conversation_subject" with "Looking for a roommate"
  Then I should fill "conversation_body" with "Hi combined_username-2, ....."
  Then I should click on "Send Message" button
  Then "combined_user_2@gmail.com" should receive an email
  When I open the email
  Then I should see "Mailboxer new message: Looking for a roommate" in the email subject
  Then I should see "Hi combined_username-2, ....." in the email body





