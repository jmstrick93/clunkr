class CarSerializer < ActiveModel::Serializer
  attributes :id, :name, :brand_id, :year, :photo_url, :created_at, :updated_at
  belongs_to :brand
  has_many :resources
  has_many :car_types, through: :car_type_cars  
  has_many :users, through: :user_car_users
end
