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
      confirmed_at Time.now
  end

  factory :profile, class: Profile do
    user_name 'existing-user'
    gender 'Female'
    is_a_smoker false
    pet_friendly false
    cleanliness_level 1
    outgoingness_level 1
    quietness_level 1
    has_residence_already 1
    street '120 Broadway'
    city 'New York'
    state 'NY'
    postal_code '10027'
  end



end

