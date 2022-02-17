require "test_helper"

class ConsciousmessesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @consciousmess = consciousmesses(:one)
  end

  test "should get index" do
    get consciousmesses_url
    assert_response :success
  end

  test "should get new" do
    get new_consciousmess_url
    assert_response :success
  end

  test "should create consciousmess" do
    assert_difference('Consciousmess.count') do
      post consciousmesses_url, params: { consciousmess: {  } }
    end

    assert_redirected_to consciousmess_url(Consciousmess.last)
  end

  test "should show consciousmess" do
    get consciousmess_url(@consciousmess)
    assert_response :success
  end

  test "should get edit" do
    get edit_consciousmess_url(@consciousmess)
    assert_response :success
  end

  test "should update consciousmess" do
    patch consciousmess_url(@consciousmess), params: { consciousmess: {  } }
    assert_redirected_to consciousmess_url(@consciousmess)
  end

  test "should destroy consciousmess" do
    assert_difference('Consciousmess.count', -1) do
      delete consciousmess_url(@consciousmess)
    end

    assert_redirected_to consciousmesses_url
  end
end
