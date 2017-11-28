class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.just_added
    self.order(created_at: :desc).limit(3)
  end

end

# 1) build an object in rails console using activerecord .build
# 2) minor feature implementation think about what you want
