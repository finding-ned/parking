require 'test_helper'

class ParkingLotStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parking_lot_status = parking_lot_statuses(:one)
  end

  test "should get index" do
    get parking_lot_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_parking_lot_status_url
    assert_response :success
  end

  test "should create parking_lot_status" do
    assert_difference('ParkingLotStatus.count') do
      post parking_lot_statuses_url, params: { parking_lot_status: { isactive: @parking_lot_status.isactive, lot_status_code: @parking_lot_status.lot_status_code, lot_status_description: @parking_lot_status.lot_status_description, lot_status_refno: @parking_lot_status.lot_status_refno } }
    end

    assert_redirected_to parking_lot_status_url(ParkingLotStatus.last)
  end

  test "should show parking_lot_status" do
    get parking_lot_status_url(@parking_lot_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_parking_lot_status_url(@parking_lot_status)
    assert_response :success
  end

  test "should update parking_lot_status" do
    patch parking_lot_status_url(@parking_lot_status), params: { parking_lot_status: { isactive: @parking_lot_status.isactive, lot_status_code: @parking_lot_status.lot_status_code, lot_status_description: @parking_lot_status.lot_status_description, lot_status_refno: @parking_lot_status.lot_status_refno } }
    assert_redirected_to parking_lot_status_url(@parking_lot_status)
  end

  test "should destroy parking_lot_status" do
    assert_difference('ParkingLotStatus.count', -1) do
      delete parking_lot_status_url(@parking_lot_status)
    end

    assert_redirected_to parking_lot_statuses_url
  end
end
