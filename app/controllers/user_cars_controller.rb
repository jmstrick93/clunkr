class UserCarsController < ApplicationController

  before_action :require_login

  def new
    @user = User.find_by(id: params[:user_id])
    @user_car = UserCar.new(user_id: params[:user_id])

    # render 'new'
  end

  def create
    @user = User.find_by(id: params[:user_id])
    @user_car = UserCar.new(user_car_params)
    respond_to do |format|
      format.json {
        if @user_car.save
          render json: @user_car
        end
        }
      format.html {
        if @user_car.save
          success_message(@user_car, "create")
          redirect_to user_path(@user)
        else
          flash_errors_and_heading(@user_car)
          render :new
        end
      }
    end
  end

  # def createWithJSON
  #   @user = User.find_by(id: params[:user_id])
  #   @user_car = UserCar.new(user_car_params)
  #   if @user_car.save
  #     render json: @user_car
  #   end
  # end

  def show
    @user_car = UserCar.find_by(id: params[:id], user_id: params[:user_id])
    render json: @user_car
  end

  def index
    @user = User.find(params[:id])
    @user_cars = @user.user_cars
    render json: @user_cars
  end

  def user_car_params
    params.require(:user_car).permit(:user_id, :id, :car_id, :color)
  end


end
