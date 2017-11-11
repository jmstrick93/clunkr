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
    @brand = Brand.new
    @car_type = CarType.new
  end

  def create
  end


end
