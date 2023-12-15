require 'test_helper'

class ParkingTransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parking_transaction = parking_transactions(:one)
  end

  test "should get index" do
    get parking_transactions_url
    assert_response :success
  end

  test "should get new" do
    get new_parking_transaction_url
    assert_response :success
  end

  test "should create parking_transaction" do
    assert_difference('ParkingTransaction.count') do
      post parking_transactions_url, params: { parking_transaction: { isactive: @parking_transaction.isactive, transaction_endtime: @parking_transaction.transaction_endtime, transaction_refno: @parking_transaction.transaction_refno, transaction_starttime: @parking_transaction.transaction_starttime, transaction_vehicle_type: @parking_transaction.transaction_vehicle_type } }
    end

    assert_redirected_to parking_transaction_url(ParkingTransaction.last)
  end

  test "should show parking_transaction" do
    get parking_transaction_url(@parking_transaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_parking_transaction_url(@parking_transaction)
    assert_response :success
  end

  test "should update parking_transaction" do
    patch parking_transaction_url(@parking_transaction), params: { parking_transaction: { isactive: @parking_transaction.isactive, transaction_endtime: @parking_transaction.transaction_endtime, transaction_refno: @parking_transaction.transaction_refno, transaction_starttime: @parking_transaction.transaction_starttime, transaction_vehicle_type: @parking_transaction.transaction_vehicle_type } }
    assert_redirected_to parking_transaction_url(@parking_transaction)
  end

  test "should destroy parking_transaction" do
    assert_difference('ParkingTransaction.count', -1) do
      delete parking_transaction_url(@parking_transaction)
    end

    assert_redirected_to parking_transactions_url
  end
end
