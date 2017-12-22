class UserCarSerializer < ActiveModel::Serializer
  attributes :id, :user, :car, :color
end
