require 'test_helper'

class ParkingVehiclesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parking_vehicle = parking_vehicles(:one)
  end

  test "should get index" do
    get parking_vehicles_url
    assert_response :success
  end

  test "should get new" do
    get new_parking_vehicle_url
    assert_response :success
  end

  test "should create parking_vehicle" do
    assert_difference('ParkingVehicle.count') do
      post parking_vehicles_url, params: { parking_vehicle: { vehicle_description: @parking_vehicle.vehicle_description, vehicle_refno: @parking_vehicle.vehicle_refno, vehicle_typerefno: @parking_vehicle.vehicle_typerefno } }
    end

    assert_redirected_to parking_vehicle_url(ParkingVehicle.last)
  end

  test "should show parking_vehicle" do
    get parking_vehicle_url(@parking_vehicle)
    assert_response :success
  end

  test "should get edit" do
    get edit_parking_vehicle_url(@parking_vehicle)
    assert_response :success
  end

  test "should update parking_vehicle" do
    patch parking_vehicle_url(@parking_vehicle), params: { parking_vehicle: { vehicle_description: @parking_vehicle.vehicle_description, vehicle_refno: @parking_vehicle.vehicle_refno, vehicle_typerefno: @parking_vehicle.vehicle_typerefno } }
    assert_redirected_to parking_vehicle_url(@parking_vehicle)
  end

  test "should destroy parking_vehicle" do
    assert_difference('ParkingVehicle.count', -1) do
      delete parking_vehicle_url(@parking_vehicle)
    end

    assert_redirected_to parking_vehicles_url
  end
end
