require 'test_helper'

class CarTest < ActiveSupport::TestCase

  def setup
    @car = cars(:accord)
    @sedan = car_types(:sedan)
    @coupe = car_types(:coupe)
  end

  #validations

  test "should not be valid without name" do
    @car.name = nil
    assert_not @car.save, "saved without name"
  end

  test "should not be valid without brand" do
    @car.brand = nil
    assert_not @car.save, "saved without brand"
  end

  #associations

  test "belongs to brand" do
    assert_instance_of Brand, @car.brand, "#{@car.brand} is not an instance of Brand"
  end

  test "has many car types" do
    assert_equal 2, @car.car_types.count
    @car.car_types.each do |t|
      assert_instance_of CarType, t, "#{t} is not an instance of CarType"
    end
  end

  test "has many users" do

  end

end
