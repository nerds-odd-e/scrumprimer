require_relative "../../scrumprimer"
require "capybara"
require "capybara/cucumber"
require "rspec"
require "rack/test"


World do
  Capybara.app = ScrumPrimerApp 	

  include Capybara::DSL
  include RSpec::Matchers
end
