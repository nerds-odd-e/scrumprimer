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
    visit '/zh-cn/'
    expect(page).to have_content "当前版本"
  end

  it "has Chinese translation on the translations page" do
    visit '/zh-cn/translations'
    expect(page).to have_content "Scrum 简章"
    expect(current_path).to eq '/zh-cn/translations'
  end

end
