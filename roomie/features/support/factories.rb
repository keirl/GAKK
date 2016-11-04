FactoryGirl.define do
  factory :user, aliases: [:existing_user] do
    email "existing_user@gmail.com"
    password "top secret"
    password_confirmation "top secret"
    confirmed_at Time.now
  end

  factory :unconfirmed_user, :parent => :user do
    email "unconfirmed_user@gmail.com"
    password "top secret"
    password_confirmation "top secret"
  end

  factory :password_reset_user, :parent => :user do
    email "password_reset_user@gmail.com"
    password "top secret"
    password_confirmation "top secret"
    confirmed_at Time.now
  end
end
