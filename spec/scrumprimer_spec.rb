require './scrumprimer'
require 'capybara'
require 'capybara/dsl'

describe "Scrum Primer Basic Specs" do

  include Capybara::DSL

  before do
    Capybara.app = ScrumPrimerApp.new
  end
  
  it "is able to get to the basic English page at the root" do
    visit '/'
    page.should have_content "Current Version"
# This test should fail at the moment. How? 
  end
    
end
