# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create! :email => 'guy@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret'
user = User.create! :email => 'keirl@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret'
user = User.create! :email => 'kourtney@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret'
user = User.create! :email => 'akila@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret'
