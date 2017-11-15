class User < ApplicationRecord
  has_secure_password

  validates :password, presence: true, length: { minimum: 6 }, unless: :login_social?
  validates :username, presence: true
  validates :email, uniqueness: true, presence: true
  validates_email_format_of :email, :message => 'email must be in valid format'

  has_many :user_cars, dependent: :destroy
  has_many :cars, through: :user_cars


  def login_social?
    !!self.uid
  end

  def self.find_or_create_from_auth_hash(auth_hash)
    #this is to deal with the "has secure password" validation for accounts created with oAuth.  Makes a secure random placeholder password, which is never used again by the user.
    self.find_or_create_by(uid: auth_hash['uid']) do |u|
      u.username = auth_hash['info']['name']
      u.email = auth_hash['info']['email']
      u.password = SecureRandom.urlsafe_base64(n=6)
    end
  end

end
