class UsersController < ApplicationController

get '/signup' do
  if logged_in?
    redirect '/cars'
  else
  erb :'/users/new.signup'
end

post '/users' do
@users = Users.new
@users.username = params[:username]
@users.password = params[:password]
if @user.save
  redirect '/login'
else
  erb :'users/new.signup'
end
end

end
