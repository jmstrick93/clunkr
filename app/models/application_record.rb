class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.just_added
    self.order(created_at: :desc).limit(3)
  end

end
