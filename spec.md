# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
        ApplicationController < Sinatra::Base, app uses gem 'sinatra' and gem 'sinatra-activerecord'
- [x] Use ActiveRecord for storing information in a database
        app uses gem 'activerecord', '4.2.5' and gem 'sinatra-activerecord'. db was set up through a series of migrations and all classes inherit from ActiveRecord::Base
- [x] Include more than one model class (list of model class names e.g. User, Post, Category)
        User, Jump, and Location classes
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts)
        Locations and Users both have many Jumps
- [x] Include user accounts
        class User, get '/users/:slug' pages
- [x] Ensure that users can't modify content created by other users
        Helper methods in ApplicationController use session information to verify user
- [x] Include user input validations
        class Jump "validates_presence_of :user_id, :location_id, :kind, :height"
        class Location "validates_presence_of :name, :address"
        class User "validates_presence_of :username, :email, :password"
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new)
        Flash messages notify the user when they do not have access to a page or the form they posted did not have all required fields completed.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
        See README.md

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
