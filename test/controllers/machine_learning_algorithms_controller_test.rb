require 'test_helper'

class MachineLearningAlgorithmsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @machine_learning_algorithm = machine_learning_algorithms(:one)
  end

  test "should get index" do
    get machine_learning_algorithms_url
    assert_response :success
  end

  test "should get new" do
    get new_machine_learning_algorithm_url
    assert_response :success
  end

  test "should create machine_learning_algorithm" do
    assert_difference('MachineLearningAlgorithm.count') do
      post machine_learning_algorithms_url, params: { machine_learning_algorithm: {  } }
    end

    assert_redirected_to machine_learning_algorithm_url(MachineLearningAlgorithm.last)
  end

  test "should show machine_learning_algorithm" do
    get machine_learning_algorithm_url(@machine_learning_algorithm)
    assert_response :success
  end

  test "should get edit" do
    get edit_machine_learning_algorithm_url(@machine_learning_algorithm)
    assert_response :success
  end

  test "should update machine_learning_algorithm" do
    patch machine_learning_algorithm_url(@machine_learning_algorithm), params: { machine_learning_algorithm: {  } }
    assert_redirected_to machine_learning_algorithm_url(@machine_learning_algorithm)
  end

  test "should destroy machine_learning_algorithm" do
    assert_difference('MachineLearningAlgorithm.count', -1) do
      delete machine_learning_algorithm_url(@machine_learning_algorithm)
    end

    assert_redirected_to machine_learning_algorithms_url
  end
end
