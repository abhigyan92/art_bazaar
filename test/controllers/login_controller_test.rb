require 'test_helper'

class LoginControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
    assert_select "title", "ArtBazaar|Login"
  end


end
