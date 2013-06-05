require 'rspec'
require 'capybara/rspec'
require 'selenium/client'
require 'magento_helper'

Capybara.configure do |capybara|
	capybara.default_driver = :selenium
	capybara.app_host = 'http://demo.magentocommerce.com'
end

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include MagentoHelper
end