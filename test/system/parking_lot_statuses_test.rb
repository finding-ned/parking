require "application_system_test_case"

class ParkingLotStatusesTest < ApplicationSystemTestCase
  setup do
    @parking_lot_status = parking_lot_statuses(:one)
  end

  test "visiting the index" do
    visit parking_lot_statuses_url
    assert_selector "h1", text: "Parking Lot Statuses"
  end

  test "creating a Parking lot status" do
    visit parking_lot_statuses_url
    click_on "New Parking Lot Status"

    check "Isactive" if @parking_lot_status.isactive
    fill_in "Lot status code", with: @parking_lot_status.lot_status_code
    fill_in "Lot status description", with: @parking_lot_status.lot_status_description
    fill_in "Lot status refno", with: @parking_lot_status.lot_status_refno
    click_on "Create Parking lot status"

    assert_text "Parking lot status was successfully created"
    click_on "Back"
  end

  test "updating a Parking lot status" do
    visit parking_lot_statuses_url
    click_on "Edit", match: :first

    check "Isactive" if @parking_lot_status.isactive
    fill_in "Lot status code", with: @parking_lot_status.lot_status_code
    fill_in "Lot status description", with: @parking_lot_status.lot_status_description
    fill_in "Lot status refno", with: @parking_lot_status.lot_status_refno
    click_on "Update Parking lot status"

    assert_text "Parking lot status was successfully updated"
    click_on "Back"
  end

  test "destroying a Parking lot status" do
    visit parking_lot_statuses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Parking lot status was successfully destroyed"
  end
end
