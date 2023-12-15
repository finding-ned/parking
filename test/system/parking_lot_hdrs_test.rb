require "application_system_test_case"

class ParkingLotHdrsTest < ApplicationSystemTestCase
  setup do
    @parking_lot_hdr = parking_lot_hdrs(:one)
  end

  test "visiting the index" do
    visit parking_lot_hdrs_url
    assert_selector "h1", text: "Parking Lot Hdrs"
  end

  test "creating a Parking lot hdr" do
    visit parking_lot_hdrs_url
    click_on "New Parking Lot Hdr"

    check "Isactive" if @parking_lot_hdr.isactive
    fill_in "Lot hdr code", with: @parking_lot_hdr.lot_hdr_code
    fill_in "Lot hdr description", with: @parking_lot_hdr.lot_hdr_description
    fill_in "Lot hdr refno", with: @parking_lot_hdr.lot_hdr_refno
    click_on "Create Parking lot hdr"

    assert_text "Parking lot hdr was successfully created"
    click_on "Back"
  end

  test "updating a Parking lot hdr" do
    visit parking_lot_hdrs_url
    click_on "Edit", match: :first

    check "Isactive" if @parking_lot_hdr.isactive
    fill_in "Lot hdr code", with: @parking_lot_hdr.lot_hdr_code
    fill_in "Lot hdr description", with: @parking_lot_hdr.lot_hdr_description
    fill_in "Lot hdr refno", with: @parking_lot_hdr.lot_hdr_refno
    click_on "Update Parking lot hdr"

    assert_text "Parking lot hdr was successfully updated"
    click_on "Back"
  end

  test "destroying a Parking lot hdr" do
    visit parking_lot_hdrs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Parking lot hdr was successfully destroyed"
  end
end
