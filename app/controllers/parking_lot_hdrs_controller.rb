class ParkingLotHdrsController < ApplicationController
  before_action :set_parking_lot_hdr, only: %i[ show edit update destroy ]

  # GET /parking_lot_hdrs or /parking_lot_hdrs.json
  def index
    @parking_lot_hdrs = ParkingLotHdr.all
  end

  # GET /parking_lot_hdrs/1 or /parking_lot_hdrs/1.json
  def show
  end

  # GET /parking_lot_hdrs/new
  def new
    @parking_lot_hdr = ParkingLotHdr.new
    get_currentlotrefno = ParkingLotHdr.where()
  end

  # GET /parking_lot_hdrs/1/edit
  def edit
  end

  # POST /parking_lot_hdrs or /parking_lot_hdrs.json
  def create
    @parking_lot_hdr = ParkingLotHdr.new(parking_lot_hdr_params)

    respond_to do |format|
      if @parking_lot_hdr.save
        format.html { redirect_to '/parking_lot_hdrs', method: 'get',notice: "Parking lot was successfully created." }
        format.json { render :show, status: :created, location: @parking_lot_hdr }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @parking_lot_hdr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parking_lot_hdrs/1 or /parking_lot_hdrs/1.json
  def update
    respond_to do |format|
      if @parking_lot_hdr.update(parking_lot_hdr_params)
        format.html { redirect_to parking_lot_hdr_url(@parking_lot_hdr), notice: "Parking lot was successfully updated." }
        format.json { render :show, status: :ok, location: @parking_lot_hdr }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @parking_lot_hdr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parking_lot_hdrs/1 or /parking_lot_hdrs/1.json
  def destroy
    @parking_lot_hdr.destroy

    respond_to do |format|
      format.html { redirect_to parking_lot_hdrs_url, notice: "Parking lot hdr was successfully removed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parking_lot_hdr
      @parking_lot_hdr = ParkingLotHdr.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def parking_lot_hdr_params
      params.require(:parking_lot_hdr).permit(:lot_hdr_refno, :lot_hdr_code, :lot_hdr_description, :isactive, :vehicle_type_refno, :level_refno)
    end
end
