class Resource < ApplicationRecord

  validates :title, uniqueness: {case_sensitive: false}
  validates :source_url, presence: true
  validates :resource_type, presence: true

  belongs_to :car
  belongs_to :resource_type
end
