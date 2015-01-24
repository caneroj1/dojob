source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.6'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3'

# USING POSTGRES
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# bootstrap yay!
gem 'bootstrap-sass', '~> 3.2.0'

# for browsing vender prefixes
gem 'autoprefixer-rails'

# haml for markup instead of ERB
gem 'haml-rails'

# primarily for the datepicker
gem 'jquery-ui-rails'

# for fancy printing in the rails console
gem 'awesome_print'

# so we can use attr_accessible
gem 'protected_attributes'

# for authentication
gem 'devise'

# searching
gem 'elasticsearch-model'
gem 'elasticsearch-rails'

# for real-time messaging
gem 'faye-rails', '~> 2.0'
gem 'thin'

# FILE ATTACHMENTS
# user profile pictures
gem 'carrierwave'
gem 'rmagick', require: false
gem 'remotipart', '~> 1.2' # asynchronous file uploads

# for in-place editing of model attributes
gem 'best_in_place'

# for validations on remote forms
gem 'client_side_validations', github: "DavyJonesLocker/client_side_validations", branch: "master"

group :development, :test do
	gem 'rspec-rails'
	gem 'factory_girl_rails'
	# for debugging of errors and more informative error pages
  gem "better_errors"
  gem "binding_of_caller"
end

group :test do
	gem 'faker'
	gem 'capybara'
	gem 'guard-rspec'
	gem 'launchy'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
