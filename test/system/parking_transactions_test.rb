require "application_system_test_case"

class ParkingTransactionsTest < ApplicationSystemTestCase
  setup do
    @parking_transaction = parking_transactions(:one)
  end

  test "visiting the index" do
    visit parking_transactions_url
    assert_selector "h1", text: "Parking Transactions"
  end

  test "creating a Parking transaction" do
    visit parking_transactions_url
    click_on "New Parking Transaction"

    check "Isactive" if @parking_transaction.isactive
    fill_in "Transaction endtime", with: @parking_transaction.transaction_endtime
    fill_in "Transaction refno", with: @parking_transaction.transaction_refno
    fill_in "Transaction starttime", with: @parking_transaction.transaction_starttime
    fill_in "Transaction vehicle type", with: @parking_transaction.transaction_vehicle_type
    click_on "Create Parking transaction"

    assert_text "Parking transaction was successfully created"
    click_on "Back"
  end

  test "updating a Parking transaction" do
    visit parking_transactions_url
    click_on "Edit", match: :first

    check "Isactive" if @parking_transaction.isactive
    fill_in "Transaction endtime", with: @parking_transaction.transaction_endtime
    fill_in "Transaction refno", with: @parking_transaction.transaction_refno
    fill_in "Transaction starttime", with: @parking_transaction.transaction_starttime
    fill_in "Transaction vehicle type", with: @parking_transaction.transaction_vehicle_type
    click_on "Update Parking transaction"

    assert_text "Parking transaction was successfully updated"
    click_on "Back"
  end

  test "destroying a Parking transaction" do
    visit parking_transactions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Parking transaction was successfully destroyed"
  end
end
