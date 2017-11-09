require 'test_helper'

class ResourceTest < ActiveSupport::TestCase

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


end
