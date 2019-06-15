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

post '/reviews/:car_id' do
@car = Car.find_by_id(params[:car_id])
if params[:content].empty? || params[:car_id] == nil
flash[:alert] = " Please, add some review."
redirect '/reviews/#{@car.id}/new'
else
  Review.create(content: params[:content], car_id: params[:car_id], user_id: current_user.id)
  redirect '/cars/#{@car.id}'

end
end




end
