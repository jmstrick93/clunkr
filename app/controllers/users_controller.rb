class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
  end

  #create an admin-only index page
  
end
