require 'test_helper'

class BlocCastControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_url
    assert_response :success
  end

  test "should get show" do
    get show_url
    assert_response :success
  end

  test "should get search" do
    get search_url
    assert_response :success
  end

end
