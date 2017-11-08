require 'test_helper'

class CarTest < ActiveSupport::TestCase

  test "should not be valid without name" do
    sedan = CarType.find_by(name: "Sedan")
    honda = Brand.find_by(name: "Honda")

    car = Car.new(brand: honda, year: 1990)
    car.car_types << sedan
    assert_not car.save, "saved without name"
  end

  test "should not be valid without brand" do
    sedan = CarType.find_by(name: "Sedan")

    car = Car.new(name: "Accord", year: 1990)
    car.car_types << sedan
    assert_not car.save, "saved without brand"
  end

end
