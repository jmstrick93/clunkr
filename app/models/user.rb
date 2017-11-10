class User < ApplicationRecord
  has_secure_password

  validates :password, presence: true, length: { minimum: 6 }, unless: :login_social?
  validates :password_confirmation, presence: true, :unless => :login_social?
  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  #SET UP CUSTOM VALIDATION TO MAKE USERNAME DOES NOT MATCH AN EMAIL

  has_many :user_cars
  has_many :cars, through: :user_cars


  def login_social?
    !!self.uid
  end

end
