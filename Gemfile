source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.0"

gem "rails", "7.0.4.2"

gem "bcrypt", "~> 3.1.0"
gem "bootsnap", "~> 1.16.0", require: false
gem "importmap-rails", "~> 1.1.0"
gem "jbuilder", "~> 2.11.0"
gem "pg", "~> 1.4.0"
gem "propshaft", "~> 0.6.0"
gem "puma", "~> 6.0.0"
gem "redis", "~> 5.0.0"
gem "stimulus-rails", "~> 1.2.0"
gem "tailwindcss-rails", "~> 2.0.0"
gem "turbo-rails", "~> 1.3.0"
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development, :test do
  gem "debug", platforms: [:mri, :mingw, :x64_mingw]

  gem "benchmark-ips"
  gem "brakeman"
  gem "erb_lint", require: false
  gem "standard"
end

group :development do
  gem "web-console"

  gem "faker"
  gem "ruby-lsp", require: false
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
