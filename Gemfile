source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.2"

gem "rails", "~> 6.1.0"

gem "bootsnap", "~> 1.8.0", require: false
gem "cssbundling-rails", "~> 0.1.0"
gem "jbuilder", "~> 2.11.0"
gem "jsbundling-rails", "~> 0.1.0"
gem "pg", "~> 1.2.0"
gem "puma", "~> 5.4.0"
gem "sass-rails", "~> 6.0.0"
gem "stimulus-rails", "~> 0.5.0"
gem "terser", "~> 1.1.0"
gem "turbo-rails", "~> 0.7.0"

gem "devise", "~> 4.8.0"
gem "pundit", "~> 2.1.0"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]

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
