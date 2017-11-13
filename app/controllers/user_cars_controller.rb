class UserCarsController < ApplicationController

  def new
    @user = User.find_by(id: params[:user_id])
    @user_car = UserCar.new(user_id: params[:user_id])
    binding.pry
    # render 'new'
  end

  def create
    @user = User.find_by(id: params[:user_id])
    @user_car = UserCar.new(user_car_params)
    if @user_car.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def user_car_params
    params.require(:user_car).permit(:user_id, :car_id, :color)
  end


end
