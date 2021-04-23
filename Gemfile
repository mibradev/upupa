source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.1"

gem "rails", "~> 6.1.0"

gem "bootsnap", "~> 1.7.0", require: false
gem "jbuilder", "~> 2.11.0"
gem "pg", "~> 1.2.0"
gem "puma", "~> 5.2.0"
gem "sass-rails", "~> 6.0.0"
gem "turbolinks", "~> 5.2.0"
gem "webpacker", "~> 5.2.0"

gem "devise", "~> 4.7.0"
gem "pundit", "~> 2.1.0"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]

  gem "rubocop", "~> 1.13.0", require: false
  gem "rubocop-minitest", "~> 0.12.0", require: false
  gem "rubocop-performance", "~> 1.11.0", require: false
  gem "rubocop-rails", "~> 2.9.0", require: false
end

group :development do
  gem "listen"
  gem "rack-mini-profiler"
  gem "spring"
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
