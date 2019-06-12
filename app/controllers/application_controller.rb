require './config/environment'
require 'sinatra/base'
require'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    use Rack::Flash
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "not_a_secret"
  end


get "/"  do
  erb :index
end

helpers do

  def logged_in?
    !!current_user
    #session[:username]
  end

  def current_user
   User.find_by(id: session[:user_id])
  end
  #def login(username)
  #  if user = User.find_by(:username => username)
  #    session[:username] = user.username
  #  else
  #    redirect '/login'
  #end
  #end

end
end
