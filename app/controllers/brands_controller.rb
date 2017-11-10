class BrandsController < ApplicationController

  #will be created in a nested cars form

  def index
    @brands = Brand.all
  end

  def show
    @brand = Brand.find_by(id: params[:id])
    @cars = Car.all
  end

end
