source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "bootstrap", "~> 4.1.3"
gem "coffee-rails", "~> 4.2"
gem "devise"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "omniauth"
gem "omniauth-twitter"
gem "puma", "~> 3.7"
gem "rails", "~> 5.1.6"
gem "sass-rails", "~> 5.0"
gem "sqlite3"
gem "toastr-rails"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"
gem "carrierwave"
gem "mini_magick"
gem "dropzonejs-rails"
gem 'bootstrap-tooltip-rails'
gem "opentok", "~> 3.1.0"
gem "font-awesome-rails"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara", "~> 2.13"
  gem "selenium-webdriver"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
