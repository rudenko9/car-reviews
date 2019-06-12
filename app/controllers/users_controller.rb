class UsersController < ApplicationController

get '/signup' do
  if logged_in?
    redirect '/cars'
  else
  erb :'/users/signup'
end
end

post '/signup' do
  if !params[:username].empty? && !params[:password].empty?
    @user = User.new(:username => params[:username], :password => params[:password])
    @user.save
    session[:user_id]= @user.id
#@user = Users.new
#@user.username = params[:username]
#@user.password = params[:password]
#if @user.save
  redirect '/login'
elsif
  redirect '/users/failure'
elsif
  erb :'users/signup'

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
  user = Users.find_by(username: params[:username])
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
