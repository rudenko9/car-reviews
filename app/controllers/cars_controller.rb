class CarsController <  ApplicationController
get '/cars' do
  @cars = Car.all
  erb  :'/cars/index'
end

get '/cars/new' do
  if logged-in?
  erb :'/cars/new'
else
  flash[:alert] = "You have to be logged in to add a product"
  redirect '/login'
end
end

post '/cars' do
  if !params[:car_name].empty?
    car = Car.find_or_create_by(name: params[:product_name])
    redirect "/cars/#{car.id}"
  else
    flash[:alert] = "Car name cannot be blank"
    redirect '/cars/new'
end
end

get '/cars/:id' do
@car = Car.find_by_id(params[:id])
erb :'/cars/show'
end

end
