require 'test_helper'

class CarTypeTest < ActiveSupport::TestCase

  test "should not save without a name" do
    car_type = CarType.new()
    assert_not car_type.save, "Saved without a name"
  end

end
