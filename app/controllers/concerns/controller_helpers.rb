module ControllerHelpers
  
  def logged_in?
    !!current_user
  end

  def field_has_content(field)
    !!field && !field.empty?
  end

end
