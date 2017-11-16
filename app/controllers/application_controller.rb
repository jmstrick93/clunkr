class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  private

  include LogicHelpers
  include ErrorHelpers
  include AuthorizationHelpers

end
