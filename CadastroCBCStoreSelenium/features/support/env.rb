require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require_relative 'helper.rb'

World(Helper)

Capybara.configure do |config|
    config.default_driver = :selenium
    config.app_host = 'https://cbcstore.com.br'
    config.default_max_wait_time = 5
end
