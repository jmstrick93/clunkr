class Car < ApplicationRecord
  validates :name, presence: true, uniqueness: {case_sensitive: false, scope: :year}
  validates :year, presence: true, numericality: true, length: {is: 4}
  validates :brand_id, presence: true

  has_many :car_type_cars
  has_many :car_types, through: :car_type_cars

  belongs_to :brand

  has_many :resources
  has_many :user_cars
  has_many :users, through: :user_cars


  def brand_name
    self.brand.name
  end

  def full_title
    "#{year} #{brand_name} #{name}"
  end




end
