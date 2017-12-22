class ResourceSerializer < ActiveModel::Serializer
  attributes :id, :title, :source_url
  belongs_to :resource_type
  belongs_to :car
end
