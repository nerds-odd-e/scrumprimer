require_relative "../../scrumprimer"
require "Capybara"
require "Capybara/cucumber"
require "rspec"
require "rack/test"


World do
  Capybara.app = ScrumPrimerApp 	

  include Capybara::DSL
  include RSpec::Matchers
end
