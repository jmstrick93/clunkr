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
    if @user_car.save
      success_message(@user_car, "create")
      redirect_to user_path(@user)
    else
      flash_errors_and_heading(@user_car)
      render :new
    end
  end

  def user_car_params
    params.require(:user_car).permit(:user_id, :car_id, :color)
  end


end
