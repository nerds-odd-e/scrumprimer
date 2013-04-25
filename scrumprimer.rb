require 'sinatra'
require 'sinatra/r18n'
require 'xml-sitemap'

class ScrumPrimerApp < Sinatra::Application

  register Sinatra::R18n
  set :root, File.dirname(__FILE__)

  def initialize_menu
    @menu_url_and_names = {
      :home => t.main.navigation.home,
      :translations => t.main.navigation.translations,
      :overview => t.main.navigation.overview,
      :anime => t.main.navigation.anime,
      :about => t.main.navigation.about,
      :contact => t.main.navigation.contact
    }
  end

  def generate_locales_link
    locale_links = []
    i18n.available_locales.each  { |available_locale| locale_links << available_locale  }
    locale_links
  end

  def generate_menu_list (active_tab, current_locale = nil)
    initialize_menu
    menu_list = []
    locale = current_locale ? "#{current_locale}/" : ''
    @menu_url_and_names.each { |url, description|
      active = (url.to_s == "#{active_tab}") ? ' class="active"' : ""
      menu_list << {"li_class" => active, "url" => url, "description" => description, "locale" => locale}
    }
    menu_list
  end

  def generate_main_page(locale, tab)
    tab = tab || 'home'
    R18n.set(locale) if locale

    @page_title = t.page_titles[tab]

    @menu_list = generate_menu_list(tab, locale)
    @available_locales = generate_locales_link()
    erb :"#{tab}"
  end

  def self.redirect(url, redirect_to)
    get url do
      send_file File.expand_path(redirect_to, settings.public_folder)
    end
  end

  redirect '/primers/scrumprimer20_french.pdf', 'primers/fr_scrumprimer20.pdf'
  redirect '/primers/scrumprimer20_simplified_chinese.pdf', 'primers/zh-cn_scrumprimer20.pdf'
  redirect '/primers/scrumprimer20_bulgarian.pdf', 'primers/bg_scrumprimer20.pdf'
  redirect '/scrumprimer20.pdf', 'primers/en_scrumprimer20.pdf'
  redirect '/scrumprimer20_small.pdf', 'primers/en_scrumprimer20_small.pdf'
  redirect '/scrumprimer120.pdf', 'primers/en_scrumprimer20_small.pdf'
  redirect '/scrumprimer199.pdf', 'primers/en_scrumprimer20_small.pdf'
  redirect '/scrum_primer_cn.pdf', 'primers/zh-cn_scrumprimer20.pdf'

  get %r{^/(home|translations|overview|anime|about|contact)?$} do |tab|
    generate_main_page(nil, tab)
  end

  get %r{^/(.*)/(home|translations|overview|anime|about|contact)?$} do |locale, tab|
    generate_main_page(locale, tab)
  end

  get '/sitemap.xml' do
    map = XmlSitemap::Map.new('scrumprimer.org') do |m|
      m.add '/translations'
      m.add '/overview'
      m.add '/anime'
      m.add '/about'
      m.add '/contact'
    end

    headers['Content-Type'] = 'text/xml'
    map.render
  end

  get '/*' do
    status 404
    @menu_list = generate_menu_list(:none)
    @available_locales = generate_locales_link()
    erb :notfound
  end
end


