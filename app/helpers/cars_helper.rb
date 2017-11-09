module CarsHelper

  def listable_car_info(car)
    render partial: 'cars/car_info_div', locals: {car: car}
  end

end
