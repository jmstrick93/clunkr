class UserCarSerializer < ActiveModel::Serializer
  attributes :id, :user, :color
  belongs_to :user
  belongs_to :car, serializer: CarSerializer
end
