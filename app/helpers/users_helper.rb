module UsersHelper
  def user_index_button
    if !!current_user && current_user.admin
      (link_to "User Index", users_path) + " |"
    end
  end

  def add_a_car_button(user)
    if (!!current_user && user.id == current_user.id) || current_user.admin
      link_to "Add A Car", new_user_user_car_path(@user)
    end
  end
end
