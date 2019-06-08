class UsersController < ApplicationController

get '/signup' do
  if logged_in?
    redirect '/cars'
  else
  erb :'/users/signup'
end
end

post '/signup' do
@users = Users.new
@users.username = params[:username]
@users.password = params[:password]
if @user.save
  redirect '/login'
else
  erb :'users/signup'
end
end

end
