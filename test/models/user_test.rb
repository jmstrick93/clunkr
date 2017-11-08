require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should not be valid without name" do
    user = User.new(email: 'jmstricker93@gmail.com', password:'password')
    assert_not user.save
  end
end
