source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.0'

gem 'rails', '~> 5.2.4'
gem 'puma', '~> 3.11'

gem 'sqlite3'

gem 'bootsnap'
gem 'listen'
gem 'webpacker'
gem 'foreman'

group :development, :test do
  gem 'pry-rails'
end

group :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
