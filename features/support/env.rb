require_relative "../../scrumprimer"
require "Capybara"
require "Capybara/cucumber"
require "rspec"
World do
  Capybara.app = ScrumPrimer 	

  include Capybara::DSL
  include RSpec::Matchers
end
