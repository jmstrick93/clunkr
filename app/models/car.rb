class Car < ApplicationRecord
  validates :name, presence: true, uniqueness: {case_sensitive: false, scope: :year}
  validates :year, presence: true, numericality: true, length: {is: 4}
  validates :brand_id, presence: true
  validates :car_types, presence: true
  validate :car_photo_url_is_valid
  validates_associated :brand

  has_many :car_type_cars, dependent: :destroy
  has_many :car_types, through: :car_type_cars

  belongs_to :brand

  has_many :resources, dependent: :destroy
  has_many :user_cars, dependent: :destroy
  has_many :users, through: :user_cars

  accepts_nested_attributes_for :brand
  # accepts_nested_attributes_for :car_types


  def brand_name
    self.brand.name
  end

  def full_title
    "#{year} #{brand_name} #{name}"
  end

  def title_brand_first
    "#{brand_name} #{name} -- #{year}"
  end

  def self.filter_by_brand(brand_id)
    self.where(brand_id: brand_id)
  end

  def car_types_attributes=(car_types_attributes)
    car_types_attributes.values.each do |car_types_attribute|
      car_type = CarType.find_or_create_by(car_types_attribute)
      self.car_types << car_type if car_type.valid?
    end
  end

  def remove_blank_car_type_ids
    self.car_types = self.car_types.reject {|type| type.id.blank?}
  end

  private

  def car_photo_url_is_valid
    if self.photo_url =~ /\A#{URI::regexp}[.](jpg|JPG|jpeg|JPEG|gif|GIF|png|PNG)\z/
      uri = URI.parse(self.photo_url)
      unless !uri.host.nil?
        errors.add(:photo_url, "must be valid url to jpeg/jpg, gif, or png file.")
      end
    else
      errors.add(:photo_url, "must be valid url to jpeg/jpg, gif, or png file.")
    end
  end

end
