class UserCarsController < ApplicationController

  def new
    @user = User.find_by(id: params[:user_id])
    @user_car = UserCar.new(user_id: params[:user_id])
    binding.pry
    # render 'new'
  end

  def create
    
    binding.pry
    redirect_to user_path(@user)
  end

  def user_car_params
    params.require(:user_car).permit(:user_id, :car_id, :color)
  end


end
