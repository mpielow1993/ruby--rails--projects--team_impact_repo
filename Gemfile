source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'ruby', '3.0.0'
gem 'rails',      '6.0.0'
gem 'aws-sdk-s3', '1.46.0', require: false
gem 'image_processing', '1.9.3'
gem 'mini_magick', '4.9.5'
gem 'stripe', '5.7.1'
gem 'whenever', '1.0.0', require: false
gem 'active_storage_validations', '0.8.2'
gem 'rails_autolink', '1.1.6'
gem 'allowable', '1.1.0'
gem 'validates_timeliness', '5.0.0.alpha5'
gem 'flatpickr', '4.5.7.0'
gem 'carrierwave', '2.1.1'
gem 'simple_form', '5.0.1'
gem 'bcrypt', '3.1.13'
gem 'faker', '2.1.2'
gem 'will_paginate', '3.1.8'
gem 'bootstrap-will_paginate', '1.0.0'
gem 'bootstrap-sass', '3.4.1'
gem "puma", ">= 3.12.2"
gem 'sass-rails', '5.1.0'
gem 'webpacker',  '4.0.7'
gem 'turbolinks', '5.2.0'
gem 'jbuilder',   '2.9.1'
gem 'bootsnap',   '1.4.4', require: false
gem 'wdm', '>= 0.1.0' if Gem.win_platform?
gem 'mimemagic', github: 'mimemagicrb/mimemagic', ref: '01f92d86d15d85cfd0f20dabd025dcbd36a8a60f' 

group :development, :test do
  gem 'sqlite3', '1.4.1'
  gem 'byebug',  '11.0.1', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console',           '4.0.1'
  gem 'listen',                '3.1.5'
  gem 'spring',                '2.1.0'
  gem 'spring-watcher-listen', '2.0.1'
end

group :test do
  gem 'capybara',                 '3.28.0'
  gem 'selenium-webdriver',       '3.142.4'
  gem 'webdrivers',               '4.1.2'
  gem 'rails-controller-testing', '1.0.4'
  gem 'minitest',                 '5.11.3'
  gem 'minitest-reporters',       '1.3.8'
  gem 'guard',                    '2.15.0'
  gem 'guard-minitest',           '2.4.6'
end

group :production do
  gem 'pg', '1.1.4'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
 gem 'tzinfo-data', '1.2019.3'
