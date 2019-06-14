class ReviewsController < ApplicationController

get '/reviews/:id/new' do
if logged_in?
  @car = Car.find_by_id(params[:id])
  erb :'/reviews/new'
else
  flash[:alert] = "You have to be logged in in order to add review"
  redirect '/login'
end
end


end
