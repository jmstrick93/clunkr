class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    # password verification later
    @user = User.new(user_params)
    if !@user.save
      flash[:alert] = "#{@user.errors.count} errors prevented successful signup:"
      prep_flash_errors(@user)
      redirect_to sign_up_path
    else
      flash[:notice] = "Successfully Logged In"
      redirect_to root_path
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  #create an admin-only index page
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :username)
  end


end
