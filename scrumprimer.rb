
require 'sinatra'

class ScrumPrimerApp < Sinatra::Application

  get '/:tab?' do

    menu = {
      :home => "Home",
      :translations => "Translations",
      :overview => "Overview Picture",
      :anime => "Anime Overview",
      :about => "About",
      :contact => "Contact"
    }
    tab = params[:tab] || "home"
    
    @menu_list = ""
    menu.each { |url, description|
      active = (url.to_s == "#{tab}") ? ' class="active "' : ""
      @menu_list += "<li #{active} id=nav#{url.capitalize}> <a href=\"/#{url}\">#{description}</a></li>\n"
    }
    erb :"#{tab}"
  end  
end


