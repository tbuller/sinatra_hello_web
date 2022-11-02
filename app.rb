require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  post '/submit' do
    name = params[:name]
    message = params[:message]
    "Hello #{name}"
  end

  get '/' do
    names = params[:names]
    return names
  end  

  post '/sort-names' do
    names = params[:names]
    names.split(",").sort.join(",")
  end  
   
end    