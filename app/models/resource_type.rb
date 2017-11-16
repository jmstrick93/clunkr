class ResourceType < ApplicationRecord

  validates :name, presence: true, uniqueness: true
  has_many :resources

end
