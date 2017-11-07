class Resource < ApplicationRecord
  belongs_to :car
  belongs_to :resource_type
end
