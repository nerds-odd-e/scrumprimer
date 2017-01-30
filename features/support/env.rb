ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'scrumprimer.rb')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.javascript_driver = :chrome
Capybara.default_driver = :chrome

Capybara.app = ScrumPrimerApp

class ScrumPrimerAppWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  ScrumPrimerAppWorld.new
end
