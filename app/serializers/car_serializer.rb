class CarSerializer < ActiveModel::Serializer
  attributes :id, :name, :brand_id, :year, :photo_url, :created_at, :updated_at
  belongs_to :brand
end
