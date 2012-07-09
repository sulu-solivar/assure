source 'http://rubygems.org'
gem 'rails', '3.2.2'

gem "devise", ">= 2.1.0.rc"
gem "omniauth"
gem 'omniauth-linkedin'
gem 'omniauth-facebook'
gem 'nifty-generators'
gem "bootstrap-sass", ">= 2.0.1"
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem "haml", ">= 3.1.4"
gem "slim-rails"
gem 'formtastic'
gem 'best_in_place'

gem 'activeadmin'
gem "meta_search",    '>= 1.1.0.pre'

group :development, :test do
  gem 'sqlite3'
  gem "rspec-rails", ">= 2.9.0.rc2"
  gem "factory_girl_rails", ">= 2.0.0.rc"
end

group :production do
  gem 'pg'
end  

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem "guard-bundler", ">= 0.1.3"  
  gem "guard-rails", ">= 0.0.3"    
  gem "guard-rspec", ">= 0.4.3"    
  gem "guard-cucumber", ">= 0.6.1" 
  gem "slim-rails"
  gem "haml-rails", ">= 0.3.4"
  gem "factory_girl_rails", ">= 2.0.0.rc"
  gem "guard", ">= 0.6.2"
end

group :test do
  gem "machinist"
  gem "email_spec", ">= 1.2.1"
  gem "cucumber-rails", ">= 1.3.0"
  gem "capybara", ">= 1.1.2"
  gem "database_cleaner", ">= 0.7.1"
  gem "launchy", ">= 2.0.5"
end

gem 'libnotify', :group => :development
gem 'rb-inotify', :group => :development
gem "mocha", :group => :test
