class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  private

  def prep_flash_errors(object)
    #could be used as helper method
    flash[:error] = []
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

end
