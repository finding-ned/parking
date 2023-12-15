class ParkingBlocksController < ApplicationController
  before_action :set_parking_block, only: %i[ show edit update destroy ]

  # GET /parking_blocks or /parking_blocks.json
  def index
    @parking_blocks = ParkingBlock.all
  end

  # GET /parking_blocks/1 or /parking_blocks/1.json
  def show
  end

  # GET /parking_blocks/new
  def new
    @parking_block = ParkingBlock.new
  end

  # GET /parking_blocks/1/edit
  def edit
  end

  # POST /parking_blocks or /parking_blocks.json
  def create
    @parking_block = ParkingBlock.new(parking_block_params)

    respond_to do |format|
      if @parking_block.save
        format.html { redirect_to parking_block_url(@parking_block), notice: "Parking block was successfully created." }
        format.json { render :show, status: :created, location: @parking_block }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @parking_block.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parking_blocks/1 or /parking_blocks/1.json
  def update
    respond_to do |format|
      if @parking_block.update(parking_block_params)
        format.html { redirect_to parking_block_url(@parking_block), notice: "Parking block was successfully updated." }
        format.json { render :show, status: :ok, location: @parking_block }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @parking_block.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parking_blocks/1 or /parking_blocks/1.json
  def destroy
    @parking_block.destroy

    respond_to do |format|
      format.html { redirect_to parking_blocks_url, notice: "Parking block was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parking_block
      @parking_block = ParkingBlock.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def parking_block_params
      params.require(:parking_block).permit(:block_refno, :block_code, :block_description, :space_refno, :level_refno, :isactive)
    end
end
