require "application_system_test_case"

class ParkingSpacesTest < ApplicationSystemTestCase
  setup do
    @parking_space = parking_spaces(:one)
  end

  test "visiting the index" do
    visit parking_spaces_url
    assert_selector "h1", text: "Parking Spaces"
  end

  test "creating a Parking space" do
    visit parking_spaces_url
    click_on "New Parking Space"

    check "Isactive" if @parking_space.isactive
    fill_in "Space description", with: @parking_space.space_description
    fill_in "Space refno", with: @parking_space.space_refno
    click_on "Create Parking space"

    assert_text "Parking space was successfully created"
    click_on "Back"
  end

  test "updating a Parking space" do
    visit parking_spaces_url
    click_on "Edit", match: :first

    check "Isactive" if @parking_space.isactive
    fill_in "Space description", with: @parking_space.space_description
    fill_in "Space refno", with: @parking_space.space_refno
    click_on "Update Parking space"

    assert_text "Parking space was successfully updated"
    click_on "Back"
  end

  test "destroying a Parking space" do
    visit parking_spaces_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Parking space was successfully destroyed"
  end
end
