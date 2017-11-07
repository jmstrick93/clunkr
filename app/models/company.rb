class Company < ApplicationRecord
  has_many :cars
  has_many :car_types, through: :cars
end
