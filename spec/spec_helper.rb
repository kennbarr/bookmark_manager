ENV['RACK_ENV'] = 'test'

require 'rspec'
require 'capybara'
require 'capybara/rspec'
require './models/link'
require './app'
require 'database_cleaner'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

Capybara.app = BookmarkManager

RSpec.configure do |config|
  config.color= true
  config.formatter= :documentation
  config.include Capybara::DSL

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end
