require "application_system_test_case"

class ParkingEntrancesTest < ApplicationSystemTestCase
  setup do
    @parking_entrance = parking_entrances(:one)
  end

  test "visiting the index" do
    visit parking_entrances_url
    assert_selector "h1", text: "Parking Entrances"
  end

  test "creating a Parking entrance" do
    visit parking_entrances_url
    click_on "New Parking Entrance"

    fill_in "Entrace refno", with: @parking_entrance.entrace_refno
    fill_in "Entrance description", with: @parking_entrance.entrance_description
    check "Isactive" if @parking_entrance.isactive
    click_on "Create Parking entrance"

    assert_text "Parking entrance was successfully created"
    click_on "Back"
  end

  test "updating a Parking entrance" do
    visit parking_entrances_url
    click_on "Edit", match: :first

    fill_in "Entrace refno", with: @parking_entrance.entrace_refno
    fill_in "Entrance description", with: @parking_entrance.entrance_description
    check "Isactive" if @parking_entrance.isactive
    click_on "Update Parking entrance"

    assert_text "Parking entrance was successfully updated"
    click_on "Back"
  end

  test "destroying a Parking entrance" do
    visit parking_entrances_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Parking entrance was successfully destroyed"
  end
end
