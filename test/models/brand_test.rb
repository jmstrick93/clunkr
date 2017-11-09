require 'test_helper'

class BrandTest < ActiveSupport::TestCase

  #validations

  test "should not save without a name" do
    brand = Brand.new()
    assert_not brand.save, "Saved without a name"
  end

  #associations

  test "Has many cars" do

  end

end
