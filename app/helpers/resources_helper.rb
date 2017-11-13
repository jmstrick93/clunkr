module ResourcesHelper
  def add_resource_button
    #this button only works when put on either a plain index page or a car's show page.
    if params[:id]
      link_to "Add Resource For This Car", new_car_resource_path(Car.find(params[:id]))
    else
      link_to "New Resource", new_resource_path
    end
  end

  def new_resource_title
    if params[:car_id]
      car_name = Car.find_by(id: params[:car_id]).full_title
      "New Resource for #{car_name}"
    else
      "New Resource"
    end
  end

end
