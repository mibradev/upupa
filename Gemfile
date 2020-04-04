# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.6"

gem "bootsnap", "~> 1.4.0", require: false
gem "devise", "~> 4.7.0"
gem "jbuilder", "~> 2.10.0"
gem "pg", "~> 1.2.0"
gem "puma", "~> 4.3.0"
gem "pundit", "~> 2.1.0"
gem "rails", "~> 6.0.0"
gem "sass-rails", "~> 6.0.0"
gem "turbolinks", "~> 5.2.0"
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem "webpacker", "~> 5.0.0"

group :development, :test do
  gem "byebug", "~> 11.1.0", platforms: [:mri, :mingw, :x64_mingw]
  gem "rubocop", "~> 0.81.0", require: false
  gem "rubocop-performance", "~> 1.5.0", require: false
  gem "rubocop-rails", "~> 2.5.0", require: false
end

group :development do
  gem "listen", "~> 3.2.0"
  gem "spring", "~> 2.1.0"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", "~> 4.0.0"
end

group :test do
  gem "capybara", "~> 3.32.0"
  gem "selenium-webdriver", "~> 3.142.0"
  gem "webdrivers", "~> 4.2.0"
end
