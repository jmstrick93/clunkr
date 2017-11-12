class Resource < ApplicationRecord

  validates :title, presence: true, uniqueness: {case_sensitive: false}
  validates :source_url, presence: true
  validates :resource_type, presence: true

  belongs_to :car, optional: true
  belongs_to :resource_type

  accepts_nested_attributes_for :resource_type

  def type
    self.resource_type
  end

  def subject
    if car.nil?
      "General"
    else
      car.full_title
    end
  end

  def self.general
    self.where(car_id: nil)
  end

  def self.for_cars
    self.where(car_id: !nil)
  end

  def self.order_by_date
    self.order(:created_at => :desc)
  end


  def full_title
    !!self.type ? "#{title} - #{type.name}" : "#{title} - General"
    end
  end

end
