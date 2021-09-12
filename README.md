# README

### Requirements

* Ruby 3.0.2
* Rails 6.1

* SQLite

### Installation

* `bundle install`
* `bundle exec rails db:create db:migrate db:seed`

* `bundle exec rails server`

Open browser and go to http://localhost:3000

### Optional

By default only the teams data is available in the database, the battings data will be populated once user upload the csv file. If you need to prepopulating the battings data you can use a rake task by run this command :

`bundle exec rake import:battings`

**Note :**

Sample CSV files (Teams.csv and Batting.csv) could be found under doc directory inside the rails application
