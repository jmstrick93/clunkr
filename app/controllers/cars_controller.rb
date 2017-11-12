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
    #
  end

  def create
    @car = Car.new(car_params)
    if !@car.brand.valid?
      #done due to issues with blank input overwriting brand_id, thus a newly created brand would know about the car but not vice versa
      @car.brand = Brand.find_by(id: car_params[:brand_id])
    else
      @car.brand.save
      @car.brand_id = @car.brand.id
    end
    @car.car_types = @car.car_types.reject {|type| type.id.blank?}
    #
    if @car.save
      #
      redirect_to car_path(@car)
    else
      flash[:alert] = view_context.pluralize(@car.errors.count,
      'error')+ " prevented this car from saving: "
      prep_flash_errors(@car)
      render 'cars/new'
    end
  end


  def edit
    @car = Car.find_by(id: params[:id])
  end

  def update
    @car = Car.find_by(id: params[:id])
    @car.assign_attributes(car_params)
    if !@car.brand.valid?
      #done due to issues with blank input overwriting brand_id, thus a newly created brand would know about the car but not vice versa
      @car.brand = Brand.find_by(id: car_params[:brand_id])
    else
      @car.brand.save
      @car.brand_id = @car.brand.id
    end
    #weeds out any invalid car types
    @car.car_types = @car.car_types.reject {|type| type.id.blank?}
    if @car.save
      redirect_to car_path(@car)
    else
      flash[:alert] = view_context.pluralize(@car.errors.count,
      'error')+ " prevented this car from saving: "
      prep_flash_errors(@car)
      render 'cars/edit'
    end
  end

  private

  def car_params
    params.require(:car).permit(:brand_id, :name, :year, :photo_url, :car_type_ids => [], car_types_attributes: [:name], :brand_attributes => [:name, :logo])
  end


end
