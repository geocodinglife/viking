source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.0"

gem "rails", "~> 7.0.4", ">= 7.0.4.3"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
# gem "jbuilder"
# gem "redis", "~> 4.0"
# gem "kredis"
gem "bcrypt", "~> 3.1.7"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
# gem "image_processing", "~> 1.2"

gem "rack-cors"
gem 'devise'
gem 'jwt'

group :development, :test do
  gem 'faker'
  gem 'factory_bot_rails'
  gem 'dotenv-rails'
  gem 'rspec-rails', '~> 6.0.0'
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem 'pry-rails'
  # gem "standard"
end
