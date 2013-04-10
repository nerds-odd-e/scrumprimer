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
end