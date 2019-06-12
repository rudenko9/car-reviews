class UsersController < ApplicationController

get '/signup' do
  if logged_in?
    redirect '/cars'
  else
  erb :'/users/signup'
end
end

post '/signup' do
@user = Users.new
@user.username = params[:username]
@user.password = params[:password]
if @user.save
  redirect '/login'
elsif
  erb :'users/signup'
end
end

get '/login' do
  erb :'/users/login'
end

post '/login' do
  @user = Users.find_by(username: params[:username], password: params[:password])
  if @user
    session[:user_id] = @user.id
    redirect '/cars'
  elsif
    redirect '/login'
  end
end

get '/logout' do
  session.clear if session[:user_id]
  redirect '/'
end


end
