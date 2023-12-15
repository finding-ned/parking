require 'test_helper'

class ParkingBlocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parking_block = parking_blocks(:one)
  end

  test "should get index" do
    get parking_blocks_url
    assert_response :success
  end

  test "should get new" do
    get new_parking_block_url
    assert_response :success
  end

  test "should create parking_block" do
    assert_difference('ParkingBlock.count') do
      post parking_blocks_url, params: { parking_block: { block_code: @parking_block.block_code, block_description: @parking_block.block_description, block_refno: @parking_block.block_refno, isactive: @parking_block.isactive, level_refno: @parking_block.level_refno, space_refno: @parking_block.space_refno } }
    end

    assert_redirected_to parking_block_url(ParkingBlock.last)
  end

  test "should show parking_block" do
    get parking_block_url(@parking_block)
    assert_response :success
  end

  test "should get edit" do
    get edit_parking_block_url(@parking_block)
    assert_response :success
  end

  test "should update parking_block" do
    patch parking_block_url(@parking_block), params: { parking_block: { block_code: @parking_block.block_code, block_description: @parking_block.block_description, block_refno: @parking_block.block_refno, isactive: @parking_block.isactive, level_refno: @parking_block.level_refno, space_refno: @parking_block.space_refno } }
    assert_redirected_to parking_block_url(@parking_block)
  end

  test "should destroy parking_block" do
    assert_difference('ParkingBlock.count', -1) do
      delete parking_block_url(@parking_block)
    end

    assert_redirected_to parking_blocks_url
  end
end
