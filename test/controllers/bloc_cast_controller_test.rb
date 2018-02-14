require 'test_helper'

class BlocCastControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bloc_cast_index_url
    assert_response :success
  end

  test "should get show" do
    get bloc_cast_show_url
    assert_response :success
  end

  test "should get search" do
    get bloc_cast_search_url
    assert_response :success
  end

end
