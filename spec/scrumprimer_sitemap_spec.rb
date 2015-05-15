# encoding: utf-8

require './scrumprimer'
require 'capybara'
require 'capybara/dsl'

set :environment, :test

describe "Scrum Primer Sitemap Specs" do
  include Capybara::DSL

  before do
    Capybara.app = ScrumPrimerApp.new
  end

  it 'should have a sitemap.xml file' do
    visit '/sitemap.xml'
    expect(page.status_code).to eq 200
  end

  it 'should have a sitemap.xml entry for /' do
    visit '/sitemap.xml'
    expect(page).to have_content 'http://scrumprimer.org/'
  end

  it 'should have a sitemap.xml entry for /translations' do
    visit '/sitemap.xml'
    expect(page).to have_content 'http://scrumprimer.org/translations'
  end

  it 'should have a sitemap.xml entry for /overview' do
    visit '/sitemap.xml'
    expect(page).to have_content 'http://scrumprimer.org/overview'
  end

  it 'should have a sitemap.xml entry for /anime' do
    visit '/sitemap.xml'
    expect(page).to have_content 'http://scrumprimer.org/anime'
  end

  it 'should have a sitemap.xml entry for /about' do
    visit '/sitemap.xml'
    expect(page).to have_content 'http://scrumprimer.org/about'
  end

  it 'should have a sitemap.xml entry for /contact' do
    visit '/sitemap.xml'
    expect(page).to have_content 'http://scrumprimer.org/contact'
  end
end
