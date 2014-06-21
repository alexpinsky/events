source 'https://rubygems.org'
ruby '2.0.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0.rc1'

# DB
gem 'pg'
gem 'hirb'

gem 'devise'
gem 'foundation-rails'
gem 'faker'
gem 'carrierwave'
gem 'carrierwave_backgrounder'
gem "jquery-fileupload-rails"
gem "mini_magick"
gem 'fog'
gem "figaro"

gem 'rack-cache'
gem 'dalli'
gem 'kgio'
gem "memcachier"

gem 'sidekiq'
gem 'sinatra', require: false
gem 'slim'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0.rc1'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.0.1'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :test do
	gem 'rspec-rails', '~> 3.0.0.beta'
	gem 'mocha'
	gem 'machinist', '>= 2.0.0.beta2'
	gem 'spork-rails'
	gem 'test_after_commit'
end

group :development do
	gem 'pry'
  gem 'quiet_assets'
end

group :production do
  gem 'rails_12factor'
  gem 'newrelic_rpm'
end

# Use unicorn as the app server
gem 'unicorn'