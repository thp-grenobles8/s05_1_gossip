require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get indentify" do
    get user_indentify_url
    assert_response :success
  end

end
