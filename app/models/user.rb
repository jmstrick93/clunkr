class User < ApplicationRecord
  has_secure_password

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password_digest, presence: true

  has_many :user_cars
  has_many :cars, through: :user_cars
  
end
