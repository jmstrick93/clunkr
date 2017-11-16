class BrandsController < ApplicationController

  #will be created in a nested cars form

  def index
    @brands = Brand.all
  end

  def show
    @brand = Brand.find_by(id: params[:id])
    @cars = Car.all
  end

  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy
    flash[:notice] = "#{@brand.name} successfully deleted"
    redirect_to brands_path
  end

end
