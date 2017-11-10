class User < ApplicationRecord
  has_secure_password

  validates :password, presence: true, length: { minimum: 6 }, unless: :login_social?
  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  #SET UP CUSTOM VALIDATION TO MAKE USERNAME DOES NOT MATCH AN EMAIL

  has_many :user_cars
  has_many :cars, through: :user_cars


  def login_social?
    !!self.uid
  end

  def self.find_or_create_from_auth_hash(auth_hash)
    self.find_or_create_by(uid: auth_hash['uid']) do |u|
      u.username = auth_hash['info']['name']
      u.email = auth_hash['info']['email']
      u.password = SecureRandom.urlsafe_base64(n=6)
    end

  end

end
