source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.2"

gem "rails", "7.0.0.alpha2"

gem "bcrypt", "~> 3.1.16"
gem "bootsnap", "~> 1.9.3", require: false
gem "cssbundling-rails", "~> 0.2.7"
gem "importmap-rails", "~> 0.9.4"
gem "jbuilder", "~> 2.11.3"
gem "pg", "~> 1.2.3"
gem "puma", "~> 5.5.2"
gem "redis", "~> 4.5.1"
gem "stimulus-rails", "~> 0.7.1"
gem "turbo-rails", "~> 7.1.1"

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
