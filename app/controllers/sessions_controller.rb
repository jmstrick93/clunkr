class SessionsController < ApplicationController

  def new
    @user = User.new
    render 'sessions/new'
  end

  def create
    #TOO FAT! SLIM DOWN LATER
    if auth
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.username = auth['info']['name']
        u.email = auth['info']['email']
        u.password = SecureRandom.urlsafe_base64(n=6)
      end
      if @user.errors
        binding.pry
        if @user.errors.keys.include?(:email)
          flash[:error] ||= []
          flash[:error] << "A user has already registered this Google email address with a non-Google account.  Please log in to this account without Google."
          return redirect_to sign_in_path
        else
          flash[:error] ||= []
          flash[:error] ||= "An unexpected error with Google SignIn has occurred. We are working to fix this as soon as we can."
        end
      end
      session[:user_id] = @user.id
      flash[:notice] = "Successfully logged in as #{@user.username}"
      binding.pry
      redirect_to root_path
    else
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
        #result if email address correct.  Password has not been checked
        flash[:alert] = "Invalid Email Address"
        redirect_to sign_in_path
      end
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

end
