class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.just_added
    self.order(created_at: :desc).limit(3)
  end

  def success_message(object, action_name)
    flash.clear
    action_name.pop if action_name[-1] == "e"
    flash[:notice] = "#{object.full_title} successfully #{action}ed"
  end

end
