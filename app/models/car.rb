class Car < ApplicationRecord
  belongs_to :car_type
  belongs_to :company
  has_many :user_cars
  has_many :users, through: :user_cars
end
