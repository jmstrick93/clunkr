module ApplicationHelper
  def display_flash_messages
    render :partial => 'layouts/flash_messages'
  end

  def formatted_flash_errors
    render :partial => 'layouts/flash_error_format'
  end

  def formatted_flash_notices
    render :partial => 'layouts/flash_notice_format'
  end

  def sign_in_out_button
    if !logged_in?
      render :partial => 'sessions/sign_in_sign_up_link'
    else
      render :partial => 'sessions/profile_or_logout_link', locals: {current_user: current_user}
    end
  end

  def delete_button(item)
    if !!current_user.admin
      if item.class != User
        link_to "Delete #{item.class}", item, method: :delete, data: { confirm: "Are you sure you want to delete #{item.full_title}?" }
      else
        link_to "Delete", item, method: :delete, data: { confirm: "Are you sure you want to delete #{item.username}?" }
      end
    end
  end


end
