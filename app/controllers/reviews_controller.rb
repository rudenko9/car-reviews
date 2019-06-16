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

get '/reviews/:review_id/edit' do
  @review = Review.find_by_id(params[:review_id])
  if @review &&  @review.user == current_user
erb :'reviews/edit'
else
  flash[:alert] = 'You must be looged in as a different user to access that review'
  redirect '/cars/#{@review.car_id}'
  #redirect '/cars/#{@review.car.id}'
end
end

post '/reviews/:review_id/edit' do
@review = Review.find_by_id(params[:review_id])
if @review.user == current_user
  @review.update(content: params[:content])
else
  flash[:alert] = "Review updated successfully!"
end
  redirect '/cars/#{@review.car_id}'
  #redirect '/cars/#{@review.car.id}'
end

get '/reviews/:review_id/delete'  do
  @review = Review.find_by_id(params[:review_id])
  @review_id = @review.car.id
  if logged_in? && @review.user == current_user
  @review.delete
  redirect '/cars/#{@review.car_id}'
  #redirect '/cars/#{@review.car.id}'
end
end


end
