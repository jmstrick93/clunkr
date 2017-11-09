class Resource < ApplicationRecord

  validates :title, presence: true, uniqueness: {case_sensitive: false}
  validates :source_url, presence: true
  validates :resource_type, presence: true

  belongs_to :car, optional: true
  belongs_to :resource_type

  def type
    self.resource_type
  end


  def full_title
    "#{title} - #{type.name}"
  end



end
