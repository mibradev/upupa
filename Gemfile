source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.2"

gem "rails", "7.0.0.alpha2"

gem "bcrypt", "~> 3.1.0"
gem "bootsnap", "~> 1.9.0", require: false
gem "cssbundling-rails", "~> 0.2.0"
gem "importmap-rails", "~> 0.7.0"
gem "jbuilder", "~> 2.11.0"
gem "pg", "~> 1.2.0"
gem "puma", "~> 5.5.1"
gem "redis", "~> 4.4.0"
gem "stimulus-rails", "~> 0.7.0"
gem "turbo-rails", "~> 0.8.0"

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
