class UserCar < ApplicationRecord
  belongs_to :user
  belongs_to :car

  def car_full_title
    car.full_title
  end

  def self.colors
    self.all.collect{|usercar| usercar.color}.uniq
  end

  def self.unique_by_color
    all.uniq(&:color)
  end

  def full_title
    car = Car.find(self.car_id)
    user = User.find(self.user_id)
    "#{user.full_title}\'s #{car.full_title}"
  end

end
