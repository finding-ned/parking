require 'test_helper'

class ParkingLotDtlsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parking_lot_dtl = parking_lot_dtls(:one)
  end

  test "should get index" do
    get parking_lot_dtls_url
    assert_response :success
  end

  test "should get new" do
    get new_parking_lot_dtl_url
    assert_response :success
  end

  test "should create parking_lot_dtl" do
    assert_difference('ParkingLotDtl.count') do
      post parking_lot_dtls_url, params: { parking_lot_dtl: { distance: @parking_lot_dtl.distance, entrance_refno: @parking_lot_dtl.entrance_refno, isactive: @parking_lot_dtl.isactive, lot_detail_refno: @parking_lot_dtl.lot_detail_refno, lot_dtl_description: @parking_lot_dtl.lot_dtl_description, lot_hdr_refno: @parking_lot_dtl.lot_hdr_refno } }
    end

    assert_redirected_to parking_lot_dtl_url(ParkingLotDtl.last)
  end

  test "should show parking_lot_dtl" do
    get parking_lot_dtl_url(@parking_lot_dtl)
    assert_response :success
  end

  test "should get edit" do
    get edit_parking_lot_dtl_url(@parking_lot_dtl)
    assert_response :success
  end

  test "should update parking_lot_dtl" do
    patch parking_lot_dtl_url(@parking_lot_dtl), params: { parking_lot_dtl: { distance: @parking_lot_dtl.distance, entrance_refno: @parking_lot_dtl.entrance_refno, isactive: @parking_lot_dtl.isactive, lot_detail_refno: @parking_lot_dtl.lot_detail_refno, lot_dtl_description: @parking_lot_dtl.lot_dtl_description, lot_hdr_refno: @parking_lot_dtl.lot_hdr_refno } }
    assert_redirected_to parking_lot_dtl_url(@parking_lot_dtl)
  end

  test "should destroy parking_lot_dtl" do
    assert_difference('ParkingLotDtl.count', -1) do
      delete parking_lot_dtl_url(@parking_lot_dtl)
    end

    assert_redirected_to parking_lot_dtls_url
  end
end
