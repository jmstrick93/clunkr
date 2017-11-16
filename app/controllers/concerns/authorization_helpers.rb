module AuthorizationHelpers

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

  def current_user
    # memoization
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

end
