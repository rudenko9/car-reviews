require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
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
    !!session[:username]
  end

def login(username,password)
  if user = User.find_by(:username => username) && user.authenticate(password)
    session[:username] = user.username
  else
    redirect '/login'



end
