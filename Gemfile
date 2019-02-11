source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.1'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false
# acceptance tests framework
gem 'capybara'
# more intuitive rails console
gem 'pry-rails', :group => :development
# Rails better errors
gem "better_errors", :group => :development
gem "binding_of_caller", :group => :development
# rails syntax checker
gem 'rubocop', require: false
# HAML syntax
gem "haml-rails", "~> 1.0"
# Simple form rails helper
gem 'simple_form'
# particles.js
# gem 'rails-assets-particles.js'

# Flexible authentication solution for Rails with Warden.
gem 'devise'
# Classier solution for file uploads for Rails, Sinatra and other Ruby web frameworks
gem 'carrierwave', '~> 1.0'
gem 'rmagick'

# Add a trash can to Rails models
gem 'rails-trash', :github => 'trilogyinteractive/rails-trash'

# Font Awesome icons
gem 'font-awesome-sass', '~> 5.4.1'

# Filterrific + will_paginate to list and filter the models
gem 'filterrific'
gem 'will_paginate', '~> 3.1.0'

# Nested models form
gem "cocoon"
# jQuery
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
# Rails autocomplete inputs using ActiveRecord
gem 'rails-jquery-autocomplete'
gem 'jquery-ui-rails'
# jQuery input masks
gem 'jquery_mask_rails', '~> 0.1.0'

# QR code generator
gem 'rqrcode'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # for unit tests
  gem 'rspec-rails', '~> 3.8'
  gem 'database_cleaner'
end

group :test do
  # for better unit tests
  gem 'shoulda-matchers', '4.0.0.rc1'
  gem 'rails-controller-testing' # If you are using Rails 5.x
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Live reload when view files are modified
  gem 'guard-livereload', '~> 2.5', require: false
  gem 'guard'
  gem 'guard-zeus'
  gem 'rack-livereload'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
