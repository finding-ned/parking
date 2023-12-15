require "application_system_test_case"

class ParkingLotDtlsTest < ApplicationSystemTestCase
  setup do
    @parking_lot_dtl = parking_lot_dtls(:one)
  end

  test "visiting the index" do
    visit parking_lot_dtls_url
    assert_selector "h1", text: "Parking Lot Dtls"
  end

  test "creating a Parking lot dtl" do
    visit parking_lot_dtls_url
    click_on "New Parking Lot Dtl"

    fill_in "Distance", with: @parking_lot_dtl.distance
    fill_in "Entrance refno", with: @parking_lot_dtl.entrance_refno
    check "Isactive" if @parking_lot_dtl.isactive
    fill_in "Lot detail refno", with: @parking_lot_dtl.lot_detail_refno
    fill_in "Lot dtl description", with: @parking_lot_dtl.lot_dtl_description
    fill_in "Lot hdr refno", with: @parking_lot_dtl.lot_hdr_refno
    click_on "Create Parking lot dtl"

    assert_text "Parking lot dtl was successfully created"
    click_on "Back"
  end

  test "updating a Parking lot dtl" do
    visit parking_lot_dtls_url
    click_on "Edit", match: :first

    fill_in "Distance", with: @parking_lot_dtl.distance
    fill_in "Entrance refno", with: @parking_lot_dtl.entrance_refno
    check "Isactive" if @parking_lot_dtl.isactive
    fill_in "Lot detail refno", with: @parking_lot_dtl.lot_detail_refno
    fill_in "Lot dtl description", with: @parking_lot_dtl.lot_dtl_description
    fill_in "Lot hdr refno", with: @parking_lot_dtl.lot_hdr_refno
    click_on "Update Parking lot dtl"

    assert_text "Parking lot dtl was successfully updated"
    click_on "Back"
  end

  test "destroying a Parking lot dtl" do
    visit parking_lot_dtls_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Parking lot dtl was successfully destroyed"
  end
end
