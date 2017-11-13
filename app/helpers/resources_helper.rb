module ResourcesHelper
  def add_resource_button
    #this button only works when put on either a plain index page or a car's show page.
    if params[:id]
      link_to "Add Resource For This Car", new_car_resource_path(Car.find(params[:id]))
    else
      link_to "New Resource", new_resource_path
    end
  end
end
