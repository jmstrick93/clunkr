class SessionsController < ApplicationController

  def new
    @user = User.new
    render 'sessions/new'
  end

  def create_from_omniauth
    if auth #if auth is present due to OmniAuth signin attempt
      @user = User.find_or_create_from_auth_hash(auth)
      if !@user.errors.empty?
        if @user.errors.keys.include?(:email)
          omniauth_email_error
          return redirect_to sign_in_path
        else
          general_omniauth_error
          return redirect_to sign_in_path
        end
      end #if there is an error, will also stop the below from running
      session[:user_id] = @user.id
      flash[:notice] = "Successfully logged in as #{@user.username}"
      redirect_to root_path
    end
  end

  def create
    if @user = User.find_by(email: params[:email])
      if @user.authenticate(params[:password])
        #result if login credentials are correct
        session[:user_id] = @user.id
        flash[:notice] = "Successfully logged in as #{@user.username}"
        redirect_to root_path
      else
        #result if email correct, password incorrect
        flash[:alert] = "Invalid Password"
        redirect_to sign_in_path
      end
    else
      #result if email address correct. Password not checked.
      flash[:alert] = "Invalid Email Address"
      redirect_to sign_in_path
    end
  end

  def destroy
    session.clear
    flash[:notice] = "Successfully signed out"
    redirect_to root_path
  end

  
  private

  def auth
    request.env['omniauth.auth']
  end

  #omniauth helpers are in the ApplicationController private methods

end
