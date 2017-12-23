class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
  skip_before_action :verify_authenticity_token, if: :json_request?



  private

  include LogicHelpers
  include ErrorHelpers
  include AuthorizationHelpers

  def json_request?
    request.format.json?
  end


  # def handle_omniauth_errors
  #   if !@user.errors.empty?
  #     if @user.errors.keys.include?(:email)
  #       omniauth_email_error
  #       return redirect_to sign_in_path
  #     else
  #       general_omniauth_error
  #       return redirect_to sign_in_path
  #     end
  #   end
  # end

end
