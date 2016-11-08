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
    confirmed_at nil
  end

  factory :password_reset_user, :parent => :user do
    email "password_reset_user@gmail.com"
    password "top secret"
    password_confirmation "top secret"
    confirmed_at Time.now
  end

  factory :preferences_user, :parent => :user do
    email "preferences_user@gmail.com"
    password "top secret"
    password_confirmation "top secret"
  end

  factory :profile_user, :parent => :user do
      email "profile_user@gmail.com"
      password "top secret"
      password_confirmation "top secret"
  end

end

