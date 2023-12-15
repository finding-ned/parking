require 'test_helper'

class ParkingLevelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parking_level = parking_levels(:one)
  end

  test "should get index" do
    get parking_levels_url
    assert_response :success
  end

  test "should get new" do
    get new_parking_level_url
    assert_response :success
  end

  test "should create parking_level" do
    assert_difference('ParkingLevel.count') do
      post parking_levels_url, params: { parking_level: { isactive: @parking_level.isactive, level_code: @parking_level.level_code, level_description: @parking_level.level_description, level_refno: @parking_level.level_refno } }
    end

    assert_redirected_to parking_level_url(ParkingLevel.last)
  end

  test "should show parking_level" do
    get parking_level_url(@parking_level)
    assert_response :success
  end

  test "should get edit" do
    get edit_parking_level_url(@parking_level)
    assert_response :success
  end

  test "should update parking_level" do
    patch parking_level_url(@parking_level), params: { parking_level: { isactive: @parking_level.isactive, level_code: @parking_level.level_code, level_description: @parking_level.level_description, level_refno: @parking_level.level_refno } }
    assert_redirected_to parking_level_url(@parking_level)
  end

  test "should destroy parking_level" do
    assert_difference('ParkingLevel.count', -1) do
      delete parking_level_url(@parking_level)
    end

    assert_redirected_to parking_levels_url
  end
end
