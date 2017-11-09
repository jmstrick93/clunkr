require 'test_helper'

class ResourceTypeTest < ActiveSupport::TestCase

  test "should be invalid without name" do
    type = ResourceType.new()
    assert_not type.save, "saved without name"
  end

end
