class SessionsController < ApplicationController

  def new
    @user = User.new
    render 'sessions/new'
  end

  def create
  if @user = User.find_by(email: params[:email])
    if @user.authenticate(params[:password])
      #result if login credentials are correct
      session[:user_id] = @user.id
      flash[:notice] = "Successfully Logged In"
      redirect_to root_path
    else
      #result if email correct, password incorrect
      flash[:alert] = "Invalid Password"
      redirect_to login_path
    end
  else
    #result if email address correct.  Password has not been checked
    flash[:alert] = "Invalid Email Address"
    redirect_to login_path
  end
end

end
