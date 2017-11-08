require 'test_helper'

class BrandTest < ActiveSupport::TestCase

  test "should not save without a name" do
    brand = Brand.new()
    assert_not brand.save, "Saved without a name"
  end

end
