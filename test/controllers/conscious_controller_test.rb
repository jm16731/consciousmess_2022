require "test_helper"

class ConsciousControllerTest < ActionDispatch::IntegrationTest
  setup do
    @consciou = conscious(:one)
  end

  test "should get index" do
    get conscious_url
    assert_response :success
  end

  test "should get new" do
    get new_consciou_url
    assert_response :success
  end

  test "should create consciou" do
    assert_difference('Consciou.count') do
      post conscious_url, params: { consciou: {  } }
    end

    assert_redirected_to consciou_url(Consciou.last)
  end

  test "should show consciou" do
    get consciou_url(@consciou)
    assert_response :success
  end

  test "should get edit" do
    get edit_consciou_url(@consciou)
    assert_response :success
  end

  test "should update consciou" do
    patch consciou_url(@consciou), params: { consciou: {  } }
    assert_redirected_to consciou_url(@consciou)
  end

  test "should destroy consciou" do
    assert_difference('Consciou.count', -1) do
      delete consciou_url(@consciou)
    end

    assert_redirected_to conscious_url
  end
end
