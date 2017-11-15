class UsersController < ApplicationController
  before_action :require_login, only: :show
  before_action :require_admin, only: [:index, :destroy]


  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    # password verification later
    @user = User.new(user_params)
    if !@user.save
      flash[:alert] = "#{@user.errors.count} errors prevented successful signup:"
      prep_flash_errors(@user)
      render :new
    else
      flash[:notice] = "Successfully Signed Up"
      redirect_to root_path
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def destroy
    @user = User.find(params[:id]).destroy
    @user.destroy
    flash[:notice] = "#{@user.username} successfully deleted"
    redirect_to users_path
  end

  #create an admin-only index page
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :username, :uid)
  end


end
