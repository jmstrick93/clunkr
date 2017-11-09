require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not be valid without name" do
    user = User.new(email: 'jmstricker93@gmail.com', password:'password')
    assert_not user.save, "Saved without a name"
  end

  test "should not be valid without password" do
    user = User.new(name: "Jim", email: 'jmstricker93@gmail.com')
    assert_not user.save, "Saved without a password"
  end

  test "should not be valid without email" do
    user = User.new(name: "Jim", password:'password' )
    assert_not user.save, "Saved without an email"
  end

  test "has many cars" do

  end

  # test "has many car types" do
    # is this possible??
    #probably with a custom method
  # end

end
