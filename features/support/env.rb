require "Capybara"
require "Capybara/cucumber"
require "rspec"
World do
 
  include Capybara::DSL
  include RSpec::Matchers
end
