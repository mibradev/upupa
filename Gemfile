source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.3"

gem "rails", "7.0.0"

gem "bcrypt", "~> 3.1.16"
gem "bootsnap", "~> 1.9.3", require: false
gem "cssbundling-rails", "~> 1.0.0"
gem "importmap-rails", "~> 1.0.1"
gem "jbuilder", "~> 2.11.3"
gem "pg", "~> 1.2.3"
gem "puma", "~> 5.5.2"
gem "redis", "~> 4.5.1"
gem "sprockets-rails", "~> 3.4.2"
gem "stimulus-rails", "~> 1.0.0"
gem "turbo-rails", "~> 1.0.0"

group :development, :test do
  gem "debug", platforms: [:mri, :mingw, :x64_mingw]

  gem "benchmark-ips"
  gem "standard"
end

group :development do
  gem "web-console"

  gem "faker"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
