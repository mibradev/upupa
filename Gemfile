source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.2"

gem "rails", "7.0.0.alpha2"

gem "bcrypt", "~> 3.1.0"
gem "bootsnap", "~> 1.9.0", require: false
gem "cssbundling-rails", "~> 0.2.0"
gem "jbuilder", "~> 2.11.0"
gem "jsbundling-rails", "~> 0.1.0"
gem "kredis", "~> 0.4.0"
gem "pg", "~> 1.2.0"
gem "puma", "~> 5.5.0"
gem "sass-rails", "~> 6.0.0"
gem "stimulus-rails", "~> 0.5.0"
gem "terser", "~> 1.1.0"
gem "turbo-rails", "~> 0.7.0"

group :development, :test do
  # gem "debug", platforms: [:mri, :mingw, :x64_mingw]
  # TODO: Remove after fixing issues with debug
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
