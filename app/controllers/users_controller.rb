require 'sinatra/base'
require'rack-flash'


class UsersController < ApplicationController

get '/signup' do
  if logged_in?
    redirect '/cars'
  else
  erb :'/users/signup'
end
end

post '/signup' do
  if !params[:name].empty? && !params[:password].empty?
    @user = User.new(:name => params[:name], :password => params[:password])
    @user.save
    session[:user_id]= @user.id
  redirect '/signup'
else
  flash[:alert] = "Username and password are required"
  redirect '/signup'

end
end

get '/login' do
  if !logged_in?
  erb :'/users/login'
else
  redirect'/cars'
end
end

post '/login' do
  user = User.find_by(:name => params[:name])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/cars'
  end
    redirect '/login'
  end


get '/logout' do
  session.clear if session[:user_id]
  redirect '/'
end

get'/users/home' do
  @user = User.find(session[:user_id])
  erb :'/users/home'
end

end
