class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  private

  def require_login
    unless logged_in?
      flash[:alert] = "You must be logged in to access this section"
      redirect_to sign_in_path # halts request cycle
    end
  end

  def require_admin
    unless !!current_user.admin
      flash[:alert] = "You must have admin permissions to do that"
      redirect_back(fallback_location: root_path)
    end
  end

  #eventually readjust this to "yield" the action that failed to happen.  VERSATILE!
  def prep_flash_errors(object)
    #could be used as helper method
    flash[:error] ||= []
    object.errors.full_messages.each do |error|
      flash[:error] << error
    end
  end

  def error_count(object)
    #also could be helper
    object.errors.count
  end

  def current_user
    # memoization
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def handle_omniauth_errors
    if !@user.errors.empty?

      if @user.errors.keys.include?(:email)
        omniauth_email_error
        return redirect_to sign_in_path
      else
        general_omniauth_error
        return redirect_to sign_in_path
      end
    end
  end

  def omniauth_email_error
    flash[:error] ||= []
    flash[:error] << "A user has already registered this Google email address with a non-Google account.  Please log in to this account without using Google."
  end

  def general_omniauth_error
    flash[:error] ||= []
    flash[:error] << "An unexpected error with Google SignIn has occurred. We are working to fix this as soon as we can."
  end

end
