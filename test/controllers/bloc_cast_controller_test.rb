require 'test_helper'

class BlocCastControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_url
    assert_response :success
  end

  test "should redirect from show if no show id is provided" do
    get show_url
    assert_redirected_to root_url
  end

  test "should get show" do
    get show_url, params: {tv_id: 1418}
    assert_response :success
  end

  test "should redirect from search if no query string is provided" do
    get search_url
    assert_redirected_to root_url
  end

  test "should get search" do
    get search_url, params: {query: "the big bang theory"}
    assert_response :success
  end

  test "should get about" do
    get about_url
    assert_response :success
  end

end
