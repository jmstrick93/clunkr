class UserCarsController < ApplicationController

  def new
    @user = User.find_by(id: params[:id])
    @user_car = UserCar.new
    # render 'new'
  end

  def create
    redirect_to user_path(@user)
  end

end
