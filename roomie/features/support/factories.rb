FactoryGirl.define do
  factory :user, aliases: [:existing_user] do
    email "existing_user@gmail.com"
    password "top secret"
    password_confirmation "top secret"
    confirmed_at Time.now
  end
end
