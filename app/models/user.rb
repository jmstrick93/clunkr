class User < ApplicationRecord
  has_secure_password

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  #SET UP CUSTOM VALIDATION TO MAKE USERNAME DOES NOT MATCH AN EMAIL

  has_many :user_cars
  has_many :cars, through: :user_cars

end
