require 'test_helper'

class PreprocessesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @preprocess = preprocesses(:one)
  end

  test "should get index" do
    get preprocesses_url
    assert_response :success
  end

  test "should get new" do
    get new_preprocess_url
    assert_response :success
  end

  test "should create preprocess" do
    assert_difference('Preprocess.count') do
      post preprocesses_url, params: { preprocess: {  } }
    end

    assert_redirected_to preprocess_url(Preprocess.last)
  end

  test "should show preprocess" do
    get preprocess_url(@preprocess)
    assert_response :success
  end

  test "should get edit" do
    get edit_preprocess_url(@preprocess)
    assert_response :success
  end

  test "should update preprocess" do
    patch preprocess_url(@preprocess), params: { preprocess: {  } }
    assert_redirected_to preprocess_url(@preprocess)
  end

  test "should destroy preprocess" do
    assert_difference('Preprocess.count', -1) do
      delete preprocess_url(@preprocess)
    end

    assert_redirected_to preprocesses_url
  end
end
