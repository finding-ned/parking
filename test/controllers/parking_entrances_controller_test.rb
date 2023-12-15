require 'test_helper'

class ParkingEntrancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parking_entrance = parking_entrances(:one)
  end

  test "should get index" do
    get parking_entrances_url
    assert_response :success
  end

  test "should get new" do
    get new_parking_entrance_url
    assert_response :success
  end

  test "should create parking_entrance" do
    assert_difference('ParkingEntrance.count') do
      post parking_entrances_url, params: { parking_entrance: { entrace_refno: @parking_entrance.entrace_refno, entrance_description: @parking_entrance.entrance_description, isactive: @parking_entrance.isactive } }
    end

    assert_redirected_to parking_entrance_url(ParkingEntrance.last)
  end

  test "should show parking_entrance" do
    get parking_entrance_url(@parking_entrance)
    assert_response :success
  end

  test "should get edit" do
    get edit_parking_entrance_url(@parking_entrance)
    assert_response :success
  end

  test "should update parking_entrance" do
    patch parking_entrance_url(@parking_entrance), params: { parking_entrance: { entrace_refno: @parking_entrance.entrace_refno, entrance_description: @parking_entrance.entrance_description, isactive: @parking_entrance.isactive } }
    assert_redirected_to parking_entrance_url(@parking_entrance)
  end

  test "should destroy parking_entrance" do
    assert_difference('ParkingEntrance.count', -1) do
      delete parking_entrance_url(@parking_entrance)
    end

    assert_redirected_to parking_entrances_url
  end
end
