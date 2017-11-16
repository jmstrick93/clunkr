class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.just_added
    self.order(created_at: :desc).limit(3)
  end

  def success_message(action_name, flash)
    flash.clear
    action_name[0...-1] if action_name[-1] == "e"
    flash[:notice] = "#{self.full_title} successfully #{action_name}ed"
  end

  

end
