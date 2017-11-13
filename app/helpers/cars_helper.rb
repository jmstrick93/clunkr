module CarsHelper

  def listable_car_info(car)
    render partial: 'cars/car_info_div', locals: {car: car}
  end

  def new_car_title
    if params[:brand_id]
      brand_name = Brand.find_by(id: params[:brand_id]).name
      "New Car for #{brand_name}"
    else
      "New Car"
    end
  end

end
