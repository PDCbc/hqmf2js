source "http://rubygems.org"

gem 'rails'

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

gem "hquery-patient-api", :git => 'https://github.com/scoophealth/patientapi.git', :branch => 'scoop-develop'
#gem 'hquery-patient-api', :path => '../patientapi'
gem 'hqmf-parser', :git => 'https://github.com/scoophealth/hqmf-parser.git', :branch => 'scoop-develop'
#gem 'hqmf-parser', :path => '../hqmf-parser'
gem "health-data-standards", :git => 'https://github.com/scoophealth/health-data-standards.git', :branch => 'scoop-develop'

gem 'nokogiri'
gem 'sprockets'
gem 'coffee-script'
gem 'uglifier'
gem 'tilt'
gem 'rake'
gem 'pry'

group :test do
  gem 'minitest'
  gem 'turn', :require => false
  gem 'cover_me', '~> 1.2.0'
  gem 'awesome_print', :require => 'ap'
  
  platforms :ruby do
    gem "therubyracer", :require => 'v8'
  end
  
  platforms :jruby do
    gem "therubyrhino"
  end
end
