require 'test_helper'

class BrandTest < ActiveSupport::TestCase

  def setup
    @brand = brands(:mg)
  end

  #validations

  test "fixture is valid" do
    assert @brand.save
  end

  test "should not save without a name" do
    @brand.name = nil
    assert_not @brand.save, "Saved without a name"
  end

  #associations

  test "Has many cars" do
    assert_equal 2, @brand.cars.count
  end

end
