class CarsController < ApplicationController

  #I should make a different home page

  def index
    @cars = Car.all
  end

  def show
    @car = Car.find_by(id: params[:id])
  end

  def new
    @car = Car.new
    @car.build_brand
    @car.car_types.build
    # binding.pry
  end

  def create
    @car = Car.new(car_params)
    if !@car.brand.valid?
      @car.brand = Brand.find_by(id: car_params[:brand_id])
    else
      @car.brand.save
      @car.brand_id = @car.brand.id
    end
    @car.car_types = @car.car_types.reject {|type| type.id.blank?}
    binding.pry
    if @car.save
      binding.pry
      redirect_to car_path(@car)
    else
      flash[:alert] = view_context.pluralize(@car.errors.count,
      'error')+ " prevented this car from saving: "
      prep_flash_errors(@car)
      redirect_to new_car_path
    end
  end


  def edit
    @car = Car.find_by(id: params[:id])
  end

  private

  def car_params
    params.require(:car).permit(:brand_id, :name, :year, :photo_url, :car_type_ids => [], car_types_attributes: [:name], :brand_attributes => [:name, :logo])
  end


end
