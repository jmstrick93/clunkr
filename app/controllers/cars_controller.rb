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
    @brand = @car.build_brand
    @car_type = @car.car_types.build
  end

  def create
    @car = Car.new(car_params)
    if !params[:brand].try("values").try("all?") {|v| v.blank?}
      @brand = @car.build_brand(params[:brand])
    end
    if !params[:car_types].try("values").try("all?") {|v| v.blank?}
      @car_type = @car.car_types.build(params[:car_type])
    end

    @car.save
    raise params.inspect

    redirect_to car_path(@car)
  end

  private

  def car_params
    params.require(:car).permit(:brand_id, :name, :year, :photo_url, car_type_ids:[], car_types_attributes: [:name], brand_attributes: [:name, :logo])
    end


end
