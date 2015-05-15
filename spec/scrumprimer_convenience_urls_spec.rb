# encoding: utf-8

require './scrumprimer'
require 'capybara'
require 'capybara/dsl'

set :environment, :test

describe "Convenience and backwards compatability URLS" do

  include Capybara::DSL

  before do
    Capybara.app = ScrumPrimerApp.new
  end

  it "Can get the English file from the home directory" do
    visit '/scrumprimer20.pdf'
    expect(page.status_code).to eq 200
    expect(page.response_headers['Content-Type']).to eq "application/pdf"
  end

  it "Can redirect also the small version" do
    visit '/scrumprimer20_small.pdf'
    expect(page.status_code).to eq 200
    expect(page.response_headers['Content-Type']).to eq "application/pdf"
  end

  it "Can get the old English version, though it redirects to the new version" do
    visit '/scrumprimer120.pdf'
    expect(page.status_code).to eq 200
    expect(page.response_headers['Content-Type']).to eq "application/pdf"
  end

  it "Can get the beta 2.0 version, though it also redirects to the new version" do
    visit '/scrumprimer199.pdf'
    expect(page.status_code).to eq 200
    expect(page.response_headers['Content-Type']).to eq "application/pdf"
  end

  it "Can redirect the Chinese version also the current version" do
    visit '/scrum_primer_cn.pdf'
    expect(page.status_code).to eq 200
    expect(page.response_headers['Content-Type']).to eq "application/pdf"
  end

  def link_should_work link
    visit link
    expect(page.status_code).to eq 200
  end

  # For backward comparability!
  it "Can access urls that don't exist anymore, for backward compatability reasons (thanks to google to sharing them)" do
    link_should_work '/primers/scrumprimer20_french.pdf'
    link_should_work '/primers/scrumprimer20_simplified_chinese.pdf'
    link_should_work '/primers/scrumprimer20_bulgarian.pdf'
  end
end

