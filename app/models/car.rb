class Car < ApplicationRecord
  validates :name, presence: true, uniqueness: {case_sensitive: false, scope: :year}
  validates :year, presence: true, numericality: true, length: {is: 4}
  validates :brand_id, presence: true
  validates :car_types, presence: true

  has_many :car_type_cars
  has_many :car_types, through: :car_type_cars

  belongs_to :brand

  has_many :resources
  has_many :user_cars
  has_many :users, through: :user_cars

  accepts_nested_attributes_for :brand
  # accepts_nested_attributes_for :car_types


  def brand_name
    self.brand.name
  end

  def full_title
    "#{year} #{brand_name} #{name}"
  end

  def self.filter_by_brand(brand_id)
    self.where(brand_id: brand_id)
  end

  def car_types_attributes=(car_types_attributes)
  car_types_attributes.values.each do |car_types_attribute|
    car_type = CarType.find_or_create_by(car_types_attribute)
    self.car_types << car_type
  end
end

end
