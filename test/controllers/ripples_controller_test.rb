require 'test_helper'

class RipplesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ripples = ripples
  end

  test "should get index" do
    get ripples_url
    assert_response :success
  end

  test "should get new" do
    get new_ripple_url
    assert_response :success
  end

  test "should create ripple" do
    @ripples.each do |rip|
      post ripples_url, params: { ripple: { message: rip.message, name: rip.name, url: rip.url } }
    end
    assert_redirected_to ripples_url
  end

  test "should go backwards 10" do
    get "/ripples"
    assert_equal 50, assigns(:id2)
    assert_equal 41, assigns(:id1)
    get "/ripples?id=41&page_num=2"
    assert_equal 2, assigns(:current_page)
    assert_equal 40, assigns(:id2)
    assert_equal 31, assigns(:id1)
    get "/ripples?id=31&page_num=2"
    assert_equal 30, assigns(:id2)
    assert_equal 21, assigns(:id1)
    get "/ripples?page_num=1"
    assert_equal 50, assigns(:id2)
    assert_equal 41, assigns(:id1)
  end

  test "should go forward 10" do
    get "/ripples"
    assert_equal 50, assigns(:id2)
    assert_equal 41, assigns(:id1)
    get "/ripples?id=41&page_num=2"
    assert_equal 2, assigns(:current_page)
    assert_equal 40, assigns(:id2)
    assert_equal 31, assigns(:id1)
    get "/ripples?id=31&page_num=2"
    assert_equal 30, assigns(:id2)
    assert_equal 21, assigns(:id1)
    get "/ripples?id=30&page_num=3"
    assert_equal 40, assigns(:id2)
    assert_equal 31, assigns(:id1)
    get "/ripples?id=40&page_num=3"
    assert_equal 50, assigns(:id2)
    assert_equal 41, assigns(:id1)
  end
end
