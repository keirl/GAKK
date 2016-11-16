# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create! :email => 'guy@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret',:confirmed_at => Time.now
user = User.create! :email => 'keirl@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret', :confirmed_at => Time.now
user = User.create! :email => 'kourtney@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret', :confirmed_at => Time.now
user4 = User.create! :email => 'akila@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret', :confirmed_at => Time.now

Profile.create(user_name: 'akila3',
               gender: 'Male',
               is_a_smoker: false,
               pet_friendly: false,
               cleanliness_level: 1,
               outgoingness_level: 1,
               quietness_level: 1,
               has_residence_already: true,
               street: '500 Riverside drive',
               city: 'New York',
               state: 'NY',
               postal_code: '10027',
               user_id: user4.id,
               latitude: nil,
               longitude: nil)

admin = Admin.create! :email => 'admin@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret'
