class CarType < ApplicationRecord
  validates :name, presence: true, uniqueness: {case_sensitive: false}

  has_many :car_type_cars, dependent: :destroy

end
