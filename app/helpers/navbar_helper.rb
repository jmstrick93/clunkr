module NavbarHelper

  def active?(page_name, controller_name)
    #page_name must be lower-case version of nav-item
    'active' if page_name.downcase == controller_name.downcase
  end

end
