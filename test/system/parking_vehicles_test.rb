require "application_system_test_case"

class ParkingVehiclesTest < ApplicationSystemTestCase
  setup do
    @parking_vehicle = parking_vehicles(:one)
  end

  test "visiting the index" do
    visit parking_vehicles_url
    assert_selector "h1", text: "Parking Vehicles"
  end

  test "creating a Parking vehicle" do
    visit parking_vehicles_url
    click_on "New Parking Vehicle"

    fill_in "Vehicle description", with: @parking_vehicle.vehicle_description
    fill_in "Vehicle refno", with: @parking_vehicle.vehicle_refno
    fill_in "Vehicle typerefno", with: @parking_vehicle.vehicle_typerefno
    click_on "Create Parking vehicle"

    assert_text "Parking vehicle was successfully created"
    click_on "Back"
  end

  test "updating a Parking vehicle" do
    visit parking_vehicles_url
    click_on "Edit", match: :first

    fill_in "Vehicle description", with: @parking_vehicle.vehicle_description
    fill_in "Vehicle refno", with: @parking_vehicle.vehicle_refno
    fill_in "Vehicle typerefno", with: @parking_vehicle.vehicle_typerefno
    click_on "Update Parking vehicle"

    assert_text "Parking vehicle was successfully updated"
    click_on "Back"
  end

  test "destroying a Parking vehicle" do
    visit parking_vehicles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Parking vehicle was successfully destroyed"
  end
end
