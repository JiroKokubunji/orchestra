require 'test_helper'

class ProjectDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_datum = project_data(:one)
  end

  test "should get index" do
    get project_data_url
    assert_response :success
  end

  test "should get new" do
    get new_project_datum_url
    assert_response :success
  end

  test "should create project_datum" do
    assert_difference('ProjectDatum.count') do
      post project_data_url, params: { project_datum: {  } }
    end

    assert_redirected_to project_datum_url(ProjectDatum.last)
  end

  test "should show project_datum" do
    get project_datum_url(@project_datum)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_datum_url(@project_datum)
    assert_response :success
  end

  test "should update project_datum" do
    patch project_datum_url(@project_datum), params: { project_datum: {  } }
    assert_redirected_to project_datum_url(@project_datum)
  end

  test "should destroy project_datum" do
    assert_difference('ProjectDatum.count', -1) do
      delete project_datum_url(@project_datum)
    end

    assert_redirected_to project_data_url
  end
end
