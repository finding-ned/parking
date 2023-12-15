require "application_system_test_case"

class ParkingSettingsTest < ApplicationSystemTestCase
  setup do
    @parking_setting = parking_settings(:one)
  end

  test "visiting the index" do
    visit parking_settings_url
    assert_selector "h1", text: "Parking Settings"
  end

  test "creating a Parking setting" do
    visit parking_settings_url
    click_on "New Parking Setting"

    check "Isactive" if @parking_setting.isactive
    fill_in "Setting code", with: @parking_setting.setting_code
    fill_in "Setting description", with: @parking_setting.setting_description
    fill_in "Setting refno", with: @parking_setting.setting_refno
    fill_in "Setting value", with: @parking_setting.setting_value
    click_on "Create Parking setting"

    assert_text "Parking setting was successfully created"
    click_on "Back"
  end

  test "updating a Parking setting" do
    visit parking_settings_url
    click_on "Edit", match: :first

    check "Isactive" if @parking_setting.isactive
    fill_in "Setting code", with: @parking_setting.setting_code
    fill_in "Setting description", with: @parking_setting.setting_description
    fill_in "Setting refno", with: @parking_setting.setting_refno
    fill_in "Setting value", with: @parking_setting.setting_value
    click_on "Update Parking setting"

    assert_text "Parking setting was successfully updated"
    click_on "Back"
  end

  test "destroying a Parking setting" do
    visit parking_settings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Parking setting was successfully destroyed"
  end
end
