require 'test_helper'

class ProjectDatumColumnsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_datum_column = project_datum_columns(:one)
  end

  test "should get index" do
    get project_datum_columns_url
    assert_response :success
  end

  test "should get new" do
    get new_project_datum_column_url
    assert_response :success
  end

  test "should create project_datum_column" do
    assert_difference('ProjectDatumColumn.count') do
      post project_datum_columns_url, params: { project_datum_column: {  } }
    end

    assert_redirected_to project_datum_column_url(ProjectDatumColumn.last)
  end

  test "should show project_datum_column" do
    get project_datum_column_url(@project_datum_column)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_datum_column_url(@project_datum_column)
    assert_response :success
  end

  test "should update project_datum_column" do
    patch project_datum_column_url(@project_datum_column), params: { project_datum_column: {  } }
    assert_redirected_to project_datum_column_url(@project_datum_column)
  end

  test "should destroy project_datum_column" do
    assert_difference('ProjectDatumColumn.count', -1) do
      delete project_datum_column_url(@project_datum_column)
    end

    assert_redirected_to project_datum_columns_url
  end
end
