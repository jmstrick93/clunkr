class UserCar < ApplicationRecord
  belongs_to :user
  belongs_to :car

  def car_full_title
    car.full_title
  end
end
