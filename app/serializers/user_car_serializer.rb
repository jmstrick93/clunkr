class UserCarSerializer < ActiveModel::Serializer
  attributes :id, :user, :color, :car
  belongs_to :user
  belongs_to :car
end
