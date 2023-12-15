require 'test_helper'

class ParkingLotHdrsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parking_lot_hdr = parking_lot_hdrs(:one)
  end

  test "should get index" do
    get parking_lot_hdrs_url
    assert_response :success
  end

  test "should get new" do
    get new_parking_lot_hdr_url
    assert_response :success
  end

  test "should create parking_lot_hdr" do
    assert_difference('ParkingLotHdr.count') do
      post parking_lot_hdrs_url, params: { parking_lot_hdr: { isactive: @parking_lot_hdr.isactive, lot_hdr_code: @parking_lot_hdr.lot_hdr_code, lot_hdr_description: @parking_lot_hdr.lot_hdr_description, lot_hdr_refno: @parking_lot_hdr.lot_hdr_refno } }
    end

    assert_redirected_to parking_lot_hdr_url(ParkingLotHdr.last)
  end

  test "should show parking_lot_hdr" do
    get parking_lot_hdr_url(@parking_lot_hdr)
    assert_response :success
  end

  test "should get edit" do
    get edit_parking_lot_hdr_url(@parking_lot_hdr)
    assert_response :success
  end

  test "should update parking_lot_hdr" do
    patch parking_lot_hdr_url(@parking_lot_hdr), params: { parking_lot_hdr: { isactive: @parking_lot_hdr.isactive, lot_hdr_code: @parking_lot_hdr.lot_hdr_code, lot_hdr_description: @parking_lot_hdr.lot_hdr_description, lot_hdr_refno: @parking_lot_hdr.lot_hdr_refno } }
    assert_redirected_to parking_lot_hdr_url(@parking_lot_hdr)
  end

  test "should destroy parking_lot_hdr" do
    assert_difference('ParkingLotHdr.count', -1) do
      delete parking_lot_hdr_url(@parking_lot_hdr)
    end

    assert_redirected_to parking_lot_hdrs_url
  end
end
