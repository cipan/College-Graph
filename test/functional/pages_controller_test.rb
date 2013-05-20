require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get graph" do
    get :graph
    assert_response :success
  end

end
