module UserCarsHelper
  def colorbox(user_car)
    render :partial => 'user_cars/colorbox', :locals => {car_color: user_car.color}
  end
end
