class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  # removed_the_below due to complications with Devise.
  # will instead allow a user to edit their alias in their user-view page
  
  # validates :name, presence: true, uniqueness: true

  has_many :user_cars
  has_many :cars, through: :user_cars

  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable
end
