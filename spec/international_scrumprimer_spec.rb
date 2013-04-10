# encoding: utf-8

require './scrumprimer'
require 'capybara'
require 'capybara/dsl'

set :environment, :test

describe "International Scrum Primer" do

  include Capybara::DSL

  before do
    Capybara.app = ScrumPrimerApp.new
    
  end
  
  it "Can access the main page in Chinese" do
    visit '/cn/'
    page.should have_content "当前版本"
  end

  it "has tabs that uses default links if page is accessed without locale" do
  	visit '/'
  	click_link 'Translations'
  	current_path.should== '/translations'   	
  end	

  it "has tabs that will use locale when accessed initially with that specific locale" do
  	visit '/cn/home'
  	click_link 'Translations'
  	current_path.should== '/cn/translations'  
  end	
end