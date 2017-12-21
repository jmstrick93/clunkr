class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
  has_many :cars, through: :user_cars
end
