module UsersHelper
  def user_index_button
    if !!current_user && current_user.admin
      (link_to "User Index", users_path) + " |"
    end
  end
end
