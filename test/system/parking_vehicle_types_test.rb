require "application_system_test_case"

class ParkingVehicleTypesTest < ApplicationSystemTestCase
  setup do
    @parking_vehicle_type = parking_vehicle_types(:one)
  end

  test "visiting the index" do
    visit parking_vehicle_types_url
    assert_selector "h1", text: "Parking Vehicle Types"
  end

  test "creating a Parking vehicle type" do
    visit parking_vehicle_types_url
    click_on "New Parking Vehicle Type"

    check "Isactive" if @parking_vehicle_type.isactive
    fill_in "Vehicle type amount", with: @parking_vehicle_type.vehicle_type_amount
    fill_in "Vehicle type description", with: @parking_vehicle_type.vehicle_type_description
    fill_in "Vehicle type refno", with: @parking_vehicle_type.vehicle_type_refno
    click_on "Create Parking vehicle type"

    assert_text "Parking vehicle type was successfully created"
    click_on "Back"
  end

  test "updating a Parking vehicle type" do
    visit parking_vehicle_types_url
    click_on "Edit", match: :first

    check "Isactive" if @parking_vehicle_type.isactive
    fill_in "Vehicle type amount", with: @parking_vehicle_type.vehicle_type_amount
    fill_in "Vehicle type description", with: @parking_vehicle_type.vehicle_type_description
    fill_in "Vehicle type refno", with: @parking_vehicle_type.vehicle_type_refno
    click_on "Update Parking vehicle type"

    assert_text "Parking vehicle type was successfully updated"
    click_on "Back"
  end

  test "destroying a Parking vehicle type" do
    visit parking_vehicle_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Parking vehicle type was successfully destroyed"
  end
end
