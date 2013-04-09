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
    puts page.all(:xpath, "id('home')")[0].value
    # /x:div[2]/x:h4")
    # puts page.all(:xpath, "id('translation')")[0].visible?
    # puts find(:css, "div.tab-pane[contains(@class, 'active')]")  
    # page.should have_xpath()
    page.should have_content "Current Version"
  end
    
end