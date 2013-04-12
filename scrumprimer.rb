
require 'sinatra'
require 'sinatra/r18n'

class ScrumPrimerApp < Sinatra::Application

  register Sinatra::R18n
  set :root, File.dirname(__FILE__)

  def initialize_menu    
    @menu_url_and_names = {
      :home => t.home.navigation.home,
      :translations => t.home.navigation.translations,
      :overview => t.home.navigation.overview,
      :anime => t.home.navigation.anime,
      :about => t.home.navigation.about,
      :contact => t.home.navigation.contact
    }
  end

  def generate_locales_link
    locale_links = []
    i18n.available_locales.each  { |available_locale| locale_links << available_locale  }
    locale_links 
  end  
  
  def generate_menu_list (active_tab, current_locale = nil)
    initialize_menu
    menu_list = ""
    locale = current_locale ? "#{current_locale}/" : ''
    @menu_url_and_names.each { |url, description|
      active = (url.to_s == "#{active_tab}") ? ' class="active "' : ""
      menu_list += "<li #{active} id=nav#{url.capitalize}> <a href=\"/#{locale}#{url}\">#{description}</a></li>\n"
    }
    menu_list
  end
  
  get %r{^/(home|translations|overview|anime|about|contact)?$} do |tab|    
    tab = tab || 'home'
    @menu_list = generate_menu_list(tab)
    @available_locales = generate_locales_link()
    erb :"#{tab}"
  end

  get %r{^/(.*)/(home|translations|overview|anime|about|contact)?$} do |locale, tab|    
    R18n.set(locale)
    tab = tab || 'home'
    @menu_list = generate_menu_list(tab, locale)
    @available_locales = generate_locales_link()
    erb :"#{tab}"
  end
  
  get '/*' do
    status 404
    @menu_list = generate_menu_list(:none)
    @available_locales = generate_locales_link()
    erb :notfound
  end
end


