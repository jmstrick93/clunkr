module ErrorHelpers

  def flash_errors_and_heading(object)
    flash[:alert] = view_context.pluralize(object.errors.count, 'error')+ " prevented this #{object.class} from saving: "
    prep_flash_errors(object)
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

  def success_message(object, action_name)
    flash.clear
    action_name[0...-1] if action_name[-1] == "e"
    flash[:notice] = "#{object.full_title} successfully #{action_name}ed"
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
