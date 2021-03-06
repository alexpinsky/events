source 'https://rubygems.org'
ruby '2.3.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'

# DB
gem 'pg'
gem 'hirb'

gem 'devise'
gem 'faker'
gem 'cloudinary'
gem "figaro"
gem 'deep_cloneable', '~> 2.0.0'
gem 'mobylette'
gem 'sitemap_generator'

gem 'rack-cache'

gem 'dalli'
gem 'kgio'
gem "memcachier"

gem 'sidekiq'
gem 'sinatra', require: false
gem 'slim'

# API
gem 'omniauth-facebook'

# Use SCSS for stylesheets
gem 'sass-rails'
gem 'sass', '3.4.5'
gem 'sprockets'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.0.1'

gem 'browserify-rails'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :test do
  gem 'rspec-rails', '~> 3.0.0.beta'
  gem "factory_girl_rails"
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