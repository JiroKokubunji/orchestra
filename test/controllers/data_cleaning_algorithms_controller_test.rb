require 'test_helper'

class DataCleaningAlgorithmsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @data_cleaning_algorithm = data_cleaning_algorithms(:one)
  end

  test "should get index" do
    get data_cleaning_algorithms_url
    assert_response :success
  end

  test "should get new" do
    get new_data_cleaning_algorithm_url
    assert_response :success
  end

  test "should create data_cleaning_algorithm" do
    assert_difference('DataCleaningAlgorithm.count') do
      post data_cleaning_algorithms_url, params: { data_cleaning_algorithm: {  } }
    end

    assert_redirected_to data_cleaning_algorithm_url(DataCleaningAlgorithm.last)
  end

  test "should show data_cleaning_algorithm" do
    get data_cleaning_algorithm_url(@data_cleaning_algorithm)
    assert_response :success
  end

  test "should get edit" do
    get edit_data_cleaning_algorithm_url(@data_cleaning_algorithm)
    assert_response :success
  end

  test "should update data_cleaning_algorithm" do
    patch data_cleaning_algorithm_url(@data_cleaning_algorithm), params: { data_cleaning_algorithm: {  } }
    assert_redirected_to data_cleaning_algorithm_url(@data_cleaning_algorithm)
  end

  test "should destroy data_cleaning_algorithm" do
    assert_difference('DataCleaningAlgorithm.count', -1) do
      delete data_cleaning_algorithm_url(@data_cleaning_algorithm)
    end

    assert_redirected_to data_cleaning_algorithms_url
  end
end
