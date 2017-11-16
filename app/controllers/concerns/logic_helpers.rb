module LogicHelpers

  def field_has_content(field)
    !!field && !field.empty?
  end

end
