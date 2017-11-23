require 'test_helper'

class ClassificationTrainingResultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @classification_training_result = classification_training_results(:one)
  end

  test "should get index" do
    get classification_training_results_url
    assert_response :success
  end

  test "should get new" do
    get new_classification_training_result_url
    assert_response :success
  end

  test "should create classification_training_result" do
    assert_difference('ClassificationTrainingResult.count') do
      post classification_training_results_url, params: { classification_training_result: {  } }
    end

    assert_redirected_to classification_training_result_url(ClassificationTrainingResult.last)
  end

  test "should show classification_training_result" do
    get classification_training_result_url(@classification_training_result)
    assert_response :success
  end

  test "should get edit" do
    get edit_classification_training_result_url(@classification_training_result)
    assert_response :success
  end

  test "should update classification_training_result" do
    patch classification_training_result_url(@classification_training_result), params: { classification_training_result: {  } }
    assert_redirected_to classification_training_result_url(@classification_training_result)
  end

  test "should destroy classification_training_result" do
    assert_difference('ClassificationTrainingResult.count', -1) do
      delete classification_training_result_url(@classification_training_result)
    end

    assert_redirected_to classification_training_results_url
  end
end
