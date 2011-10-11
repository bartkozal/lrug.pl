require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'capybara/rspec'

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:github] = {
    'uid' => '123545',
    'provider' => 'github',
    'user_info' => { 'name' => 'Steve Jobs' },
    'extra' => { 'user_hash' => { 'company' => 'Apple' }}
  }

  RSpec.configure do |config|
    config.include Factory::Syntax::Methods
    config.mock_with :rspec
    config.use_transactional_fixtures = true
  end
end

Spork.each_run do
  FactoryGirl.reload
end
