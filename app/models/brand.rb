class Brand < ApplicationRecord
  validates :name, presence: true, uniqueness: {case_sensitive: false}

  has_many :cars
  has_many :car_types, through: :cars
end
