class CarsController < ApplicationController

  def index
    @cars = Car.all
  end

  def show
    @car = Car.find_by(id: params[:id])
  end


end
