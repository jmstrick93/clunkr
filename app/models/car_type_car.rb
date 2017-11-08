class CarTypeCar < ApplicationRecord
  belongs_to :car_type
  belongs_to :car
end
