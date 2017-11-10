module ApplicationHelper
  def display_flash_messages
    render :partial => 'layouts/flash_messages'
  end

  def formatted_flash_errors
    render :partial => 'layouts/flash_error_format'
  end

  def sign_in_out_button
    if !logged_in?
      render :partial => 'sessions/sign_in_sign_up_link'
    else
      link_to "Log Out", log_out_path
    end
  end


end
