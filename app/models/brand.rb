class Brand < ApplicationRecord

  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validate :brand_photo_url_is_valid

  has_many :cars
  has_many :car_types, through: :cars

  # accepts_nested_attributes_for :cars


  private

  def brand_photo_url_is_valid
    if self.logo =~ /\A#{URI::regexp}[.](jpg|JPG|jpeg|JPEG|gif|GIF|png|PNG)\z/
      uri = URI.parse(self.logo)
      binding.pry
      unless !uri.host.nil?
        errors.add(:logo, "must be valid url to jpeg/jpg, gif, or png file.")
      end
    else
      errors.add(:logo, "must be valid url to jpeg/jpg, gif, or png file.")
    end
  end

end
