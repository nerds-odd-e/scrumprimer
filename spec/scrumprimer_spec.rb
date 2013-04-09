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
    page.all(:xpath, "id('home')")[0]["class"].include?("active").should== true
    page.should have_content "Current Version"
  end
    
end
