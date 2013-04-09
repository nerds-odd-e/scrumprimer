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
    page.all(:xpath, "id('home')")[0]["class"].should include("active")
    page.all(:xpath, "id('mainTabs')/li[@id='navHome']")[0]["class"].should include("active")
    page.should have_content "Current Version"
  end
  
  it "can click to the translation tab and the url changed" do
    visit '/'
    page.status_code.should == 200
    
    click_link "Translations"
    
    page.should have_content "PDF versions of the Overview picture"
    page.all(:xpath, "id('mainTabs')/li[@id='navTranslations']")[0]["class"].should include("active")
    current_path.should== "/translations"
  end
  
  it "can click on the overview tab" do
    visit '/'
    click_link "Overview Picture"
    page.status_code.should == 200
    page.should have_content "PDF versions of the overview:"
    current_path.should== "/overview"    
  end
  
  it "can click on the anime tab" do
    visit '/'
    click_link "Anime Overview"
    page.status_code.should == 200
    page.should have_content "High-resolution versions of the overview:"
    current_path.should== "/anime"    
  end
  
  it "can click on the about tab" do
    visit '/'
    click_link "About"
    page.status_code.should == 200
    page.should have_content "Scrum Primer Creation"
    current_path.should== "/about"    
  end

  it "can click on the contact tab" do
    visit '/'
    click_link "Contact"
    page.status_code.should == 200
    page.should have_content "Feedback"
    current_path.should== "/contact"    
  end
    
end
