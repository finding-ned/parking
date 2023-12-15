require 'test_helper'

class ParkingSettingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parking_setting = parking_settings(:one)
  end

  test "should get index" do
    get parking_settings_url
    assert_response :success
  end

  test "should get new" do
    get new_parking_setting_url
    assert_response :success
  end

  test "should create parking_setting" do
    assert_difference('ParkingSetting.count') do
      post parking_settings_url, params: { parking_setting: { isactive: @parking_setting.isactive, setting_code: @parking_setting.setting_code, setting_description: @parking_setting.setting_description, setting_refno: @parking_setting.setting_refno, setting_value: @parking_setting.setting_value } }
    end

    assert_redirected_to parking_setting_url(ParkingSetting.last)
  end

  test "should show parking_setting" do
    get parking_setting_url(@parking_setting)
    assert_response :success
  end

  test "should get edit" do
    get edit_parking_setting_url(@parking_setting)
    assert_response :success
  end

  test "should update parking_setting" do
    patch parking_setting_url(@parking_setting), params: { parking_setting: { isactive: @parking_setting.isactive, setting_code: @parking_setting.setting_code, setting_description: @parking_setting.setting_description, setting_refno: @parking_setting.setting_refno, setting_value: @parking_setting.setting_value } }
    assert_redirected_to parking_setting_url(@parking_setting)
  end

  test "should destroy parking_setting" do
    assert_difference('ParkingSetting.count', -1) do
      delete parking_setting_url(@parking_setting)
    end

    assert_redirected_to parking_settings_url
  end
end
