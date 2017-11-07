module ApplicationHelper
  def display_flash_messages
    render :partial => 'layouts/flash_messages'
  end
end
