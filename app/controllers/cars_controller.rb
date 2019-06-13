class CarsController <  ApplicationController
get '/cars' do
  @cars = Car.all
  erb  :'/cars/index'
end

get '/cars/new' do
  if logged-in?
  erb : 'cars/new'
else
  flash[:alert] = "You have to be logged in to add a product"
  redirect '/login'
end
end



end
