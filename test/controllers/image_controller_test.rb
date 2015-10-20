require 'test_helper'

class ImageControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get randomize" do
    get :randomize
    assert_response :success
  end

end
