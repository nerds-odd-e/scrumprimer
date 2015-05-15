# encoding: utf-8

require './scrumprimer'
require 'capybara'
require 'capybara/dsl'

set :environment, :test

describe "Scrum Primer Basic Specs" do

  include Capybara::DSL

  before do
    Capybara.app = ScrumPrimerApp.new
  end

  it "is able to get to the basic English page at the root" do
    visit '/'
    expect(page.all(:xpath, "id('home')")[0]["class"]).to include("active")
    expect(page.all(:xpath, "id('mainTabs')/li[@id='navHome']")[0]["class"]).to include("active")
    expect(page).to have_content "Current Version"
  end

  it "can click to the translation tab and the url changed" do
    visit '/'
    click_link "Translations"

    expect(page).to have_content "PDF versions of the Overview picture"
    expect(page.all(:xpath, "id('mainTabs')/li[@id='navTranslations']")[0]["class"]).to include("active")
           expect(current_path).to eq "/translations"
  end

  it "can click on the overview tab" do
    visit '/'
    click_link "Overview Picture"
    expect(page).to have_content "PDF versions of the Overview picture"
    expect(current_path).to eq "/overview"
  end

  it "can click on the anime tab" do
    visit '/'
    click_link "Anime Overview"
    expect(page).to have_content "High-resolution versions of the overview:"
    expect(current_path).to eq "/anime"
  end

  it "can click on the about tab" do
    visit '/'
    click_link "About"
    expect(page).to have_content "Scrum Primer Creation"
    expect(current_path).to eq "/about"
  end

  it "can click on the contact tab" do
    visit '/'
    click_link "Contact"
    expect(page).to have_content "Feedback"
    expect(current_path).to eq "/contact"
  end

  it "has all pages with links to all available locales in the i18n directory" do
    visit '/about'
    locales = []
    Dir.glob("./i18n/*.yml") {|file| locales << File.basename(file, ".*")}

    locales.each { |locale|
      page.has_link? "/#{locale}/]"
    }
  end

  it "should go to the 404 page when going to an URL that doesn't exist" do
    visit '/doesntexist'
    expect(page).to have_content "404"
    expect(page.status_code).to eq 404
  end

  it "should have different title pages for each page" do
    visit '/'
    expect(page).to have_title "Scrum Primer - Short Introduction"
    visit '/translations'
    expect(page).to have_title "Scrum Primer - Translations"
  end

  it 'should have a sitemap.xml file' do
    visit '/sitemap.xml'
    expect(page.status_code).to eq 200
    expect(page).to have_content 'http://scrumprimer.org/'
  end
end
