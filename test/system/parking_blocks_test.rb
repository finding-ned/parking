require "application_system_test_case"

class ParkingBlocksTest < ApplicationSystemTestCase
  setup do
    @parking_block = parking_blocks(:one)
  end

  test "visiting the index" do
    visit parking_blocks_url
    assert_selector "h1", text: "Parking Blocks"
  end

  test "creating a Parking block" do
    visit parking_blocks_url
    click_on "New Parking Block"

    fill_in "Block code", with: @parking_block.block_code
    fill_in "Block description", with: @parking_block.block_description
    fill_in "Block refno", with: @parking_block.block_refno
    check "Isactive" if @parking_block.isactive
    fill_in "Level refno", with: @parking_block.level_refno
    fill_in "Space refno", with: @parking_block.space_refno
    click_on "Create Parking block"

    assert_text "Parking block was successfully created"
    click_on "Back"
  end

  test "updating a Parking block" do
    visit parking_blocks_url
    click_on "Edit", match: :first

    fill_in "Block code", with: @parking_block.block_code
    fill_in "Block description", with: @parking_block.block_description
    fill_in "Block refno", with: @parking_block.block_refno
    check "Isactive" if @parking_block.isactive
    fill_in "Level refno", with: @parking_block.level_refno
    fill_in "Space refno", with: @parking_block.space_refno
    click_on "Update Parking block"

    assert_text "Parking block was successfully updated"
    click_on "Back"
  end

  test "destroying a Parking block" do
    visit parking_blocks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Parking block was successfully destroyed"
  end
end
