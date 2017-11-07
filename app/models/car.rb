class Car < ApplicationRecord
  belongs_to :car_type
  belongs_to :brand
  has_many :resources
  has_many :user_cars
  has_many :users, through: :user_cars
end
