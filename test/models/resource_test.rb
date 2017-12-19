require 'test_helper'

class ResourceTest < ActiveSupport::TestCase

  def setup
    @resource1 = resources(:one)
    @resource2 = resources(:coolcars)
  end

  test "should not save without title" do
    title = "Title"
    type = ResourceType.find_by(name: "Manual")
    url = "URL"

    resource = Resource.new(source_url: url, car_id: 1)
    resource.resource_type = type
    assert_not resource.save, "saved without title"
  end

  test "should not save without source_url" do
    title = "Title"
    type = ResourceType.find_by(name: "Manual")
    url = "URL"

    resource = Resource.new(title: title, car_id: 1)
    resource.resource_type = type
    assert_not resource.save, "saved without source_url"
  end

  test "optionally has car_id" do
    #do this tomorrow
  end

  test "can save without car_id" do
    title = "Title"
    type = ResourceType.find_by(name: "Manual")
    url = "URL"

    resource = Resource.new(title: title, source_url: "URL")
    resource.resource_type = type
    assert resource.save, "does not save without car_id"
  end

  test "if resource has a type, #full_title  consists of resource's name and type" do
    assert_equal("MGB Maintenance - Manual", @resource1.full_title)
  end

  test "if resource does not have type #full title consists of a resource's name followed by '- General'" do
    assert_equal("Cool Cars For Sale - General", @resource2.full_title)
  end

end
