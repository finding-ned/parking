require "application_system_test_case"

class ParkingLevelsTest < ApplicationSystemTestCase
  setup do
    @parking_level = parking_levels(:one)
  end

  test "visiting the index" do
    visit parking_levels_url
    assert_selector "h1", text: "Parking Levels"
  end

  test "creating a Parking level" do
    visit parking_levels_url
    click_on "New Parking Level"

    check "Isactive" if @parking_level.isactive
    fill_in "Level code", with: @parking_level.level_code
    fill_in "Level description", with: @parking_level.level_description
    fill_in "Level refno", with: @parking_level.level_refno
    click_on "Create Parking level"

    assert_text "Parking level was successfully created"
    click_on "Back"
  end

  test "updating a Parking level" do
    visit parking_levels_url
    click_on "Edit", match: :first

    check "Isactive" if @parking_level.isactive
    fill_in "Level code", with: @parking_level.level_code
    fill_in "Level description", with: @parking_level.level_description
    fill_in "Level refno", with: @parking_level.level_refno
    click_on "Update Parking level"

    assert_text "Parking level was successfully updated"
    click_on "Back"
  end

  test "destroying a Parking level" do
    visit parking_levels_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Parking level was successfully destroyed"
  end
end
