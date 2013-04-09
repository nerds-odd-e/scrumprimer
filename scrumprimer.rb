
require 'sinatra'

class ScrumPrimerApp < Sinatra::Application

  get '/' do
    erb :index
  end
end


# get '/:tab' do |current_page|
#   erb :index  
# end
