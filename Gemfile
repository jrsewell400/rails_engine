source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'faraday'
gem 'fast_jsonapi'
gem 'figaro'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'uglifier', '>= 1.3.0'
gem 'rack-cors'
gem 'rails', '~> 5.1.7'
gem 'sass-rails', '~> 5.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'launchy'
  gem 'pry'
  gem 'rubocop'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'selenium-webdriver'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'simplecov', require: false
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
