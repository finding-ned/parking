require 'test_helper'

class ParkingVehicleTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parking_vehicle_type = parking_vehicle_types(:one)
  end

  test "should get index" do
    get parking_vehicle_types_url
    assert_response :success
  end

  test "should get new" do
    get new_parking_vehicle_type_url
    assert_response :success
  end

  test "should create parking_vehicle_type" do
    assert_difference('ParkingVehicleType.count') do
      post parking_vehicle_types_url, params: { parking_vehicle_type: { isactive: @parking_vehicle_type.isactive, vehicle_type_amount: @parking_vehicle_type.vehicle_type_amount, vehicle_type_description: @parking_vehicle_type.vehicle_type_description, vehicle_type_refno: @parking_vehicle_type.vehicle_type_refno } }
    end

    assert_redirected_to parking_vehicle_type_url(ParkingVehicleType.last)
  end

  test "should show parking_vehicle_type" do
    get parking_vehicle_type_url(@parking_vehicle_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_parking_vehicle_type_url(@parking_vehicle_type)
    assert_response :success
  end

  test "should update parking_vehicle_type" do
    patch parking_vehicle_type_url(@parking_vehicle_type), params: { parking_vehicle_type: { isactive: @parking_vehicle_type.isactive, vehicle_type_amount: @parking_vehicle_type.vehicle_type_amount, vehicle_type_description: @parking_vehicle_type.vehicle_type_description, vehicle_type_refno: @parking_vehicle_type.vehicle_type_refno } }
    assert_redirected_to parking_vehicle_type_url(@parking_vehicle_type)
  end

  test "should destroy parking_vehicle_type" do
    assert_difference('ParkingVehicleType.count', -1) do
      delete parking_vehicle_type_url(@parking_vehicle_type)
    end

    assert_redirected_to parking_vehicle_types_url
  end
end
