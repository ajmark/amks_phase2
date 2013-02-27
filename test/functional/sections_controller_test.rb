require 'test_helper'

class SectionsControllerTest < ActionController::TestCase
  setup do
    @section = sections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create section" do
    assert_difference('Section.count') do
      post :create, section: { active: @section.active, event_id: @section.event_id, id: @section.id, location: @section.location, max_age: @section.max_age, min_age: @section.min_age, round_time: @section.round_time, tournament_id: @section.tournament_id }
    end

    assert_redirected_to section_path(assigns(:section))
  end

  test "should show section" do
    get :show, id: @section
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @section
    assert_response :success
  end

  test "should update section" do
    put :update, id: @section, section: { active: @section.active, event_id: @section.event_id, id: @section.id, location: @section.location, max_age: @section.max_age, min_age: @section.min_age, round_time: @section.round_time, tournament_id: @section.tournament_id }
    assert_redirected_to section_path(assigns(:section))
  end

  test "should destroy section" do
    assert_difference('Section.count', -1) do
      delete :destroy, id: @section
    end

    assert_redirected_to sections_path
  end
end
