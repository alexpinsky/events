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
gem "jquery-fileupload-rails"
gem "mini_magick"
gem 'fog'
gem "figaro"
gem 'social-share-button'
gem 'deep_cloneable', '~> 2.0.0'

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

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.0.1'

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