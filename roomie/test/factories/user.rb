# This will guess the User class
FactoryGirl.define do
  factory :user do
    email "audesilva@gmail.com"
    password  "123456"
    password_confirmation "123456"
  end
end
