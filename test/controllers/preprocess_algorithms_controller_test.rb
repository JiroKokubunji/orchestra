require 'test_helper'

class PreprocessAlgorithmsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @preprocess_algorithm = preprocess_algorithms(:one)
  end

  test "should get index" do
    get preprocess_algorithms_url
    assert_response :success
  end

  test "should get new" do
    get new_preprocess_algorithm_url
    assert_response :success
  end

  test "should create preprocess_algorithm" do
    assert_difference('PreprocessAlgorithm.count') do
      post preprocess_algorithms_url, params: { preprocess_algorithm: {  } }
    end

    assert_redirected_to preprocess_algorithm_url(PreprocessAlgorithm.last)
  end

  test "should show preprocess_algorithm" do
    get preprocess_algorithm_url(@preprocess_algorithm)
    assert_response :success
  end

  test "should get edit" do
    get edit_preprocess_algorithm_url(@preprocess_algorithm)
    assert_response :success
  end

  test "should update preprocess_algorithm" do
    patch preprocess_algorithm_url(@preprocess_algorithm), params: { preprocess_algorithm: {  } }
    assert_redirected_to preprocess_algorithm_url(@preprocess_algorithm)
  end

  test "should destroy preprocess_algorithm" do
    assert_difference('PreprocessAlgorithm.count', -1) do
      delete preprocess_algorithm_url(@preprocess_algorithm)
    end

    assert_redirected_to preprocess_algorithms_url
  end
end
