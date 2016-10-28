bundle install
rake db:drop
rake db:migrate

rake db:seed

echo "Running Tests with cucumber"
rake cucumber:all
rails server
