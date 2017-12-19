require 'test_helper'
require_relative '../../app/controllers/concerns/error_helpers'

class SuccessMessageTest < ActionDispatch::IntegrationTest
  include ErrorHelpers
  def setup
    @car = cars(:accord)
    @the_resource = resources(:one)
  end

  def duplicate_success_message(object, action_name, flash = {})
      action_name = action_name[0...-1] if action_name[-1] == "e"
      flash[:notice] = "#{object.full_title} successfully #{action_name}ed"
  end


  test "#success_message works with cars#destroy action" do
    duplicate_success_message(@car, "destroy")
    assert_equal("1990 Honda Accord successfully destroyed", flash[:notice])
  end

  test "#success_message works with resources" do
    @flash = flash
    duplicate_success_message(@resource, "create")
    assert_equal("MGB Maintenance - Manual successfully created", flash[:notice])
  end

end
