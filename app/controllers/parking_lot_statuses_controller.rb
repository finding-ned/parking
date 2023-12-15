class ParkingLotStatusesController < ApplicationController
  before_action :set_parking_lot_status, only: %i[ show edit update destroy ]

  # GET /parking_lot_statuses or /parking_lot_statuses.json
  def index
    @parking_lot_statuses = ParkingLotStatus.all
  end

  # GET /parking_lot_statuses/1 or /parking_lot_statuses/1.json
  def show
  end

  # GET /parking_lot_statuses/new
  def new
    @parking_lot_status = ParkingLotStatus.new
  end

  # GET /parking_lot_statuses/1/edit
  def edit
  end

  # POST /parking_lot_statuses or /parking_lot_statuses.json
  def create
    @parking_lot_status = ParkingLotStatus.new(parking_lot_status_params)

    respond_to do |format|
      if @parking_lot_status.save
        format.html { redirect_to parking_lot_status_url(@parking_lot_status), notice: "Parking lot status was successfully created." }
        format.json { render :show, status: :created, location: @parking_lot_status }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @parking_lot_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parking_lot_statuses/1 or /parking_lot_statuses/1.json
  def update
    respond_to do |format|
      if @parking_lot_status.update(parking_lot_status_params)
        format.html { redirect_to parking_lot_status_url(@parking_lot_status), notice: "Parking lot status was successfully updated." }
        format.json { render :show, status: :ok, location: @parking_lot_status }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @parking_lot_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parking_lot_statuses/1 or /parking_lot_statuses/1.json
  def destroy
    @parking_lot_status.destroy

    respond_to do |format|
      format.html { redirect_to parking_lot_statuses_url, notice: "Parking lot status was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parking_lot_status
      @parking_lot_status = ParkingLotStatus.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def parking_lot_status_params
      params.require(:parking_lot_status).permit(:lot_status_refno, :lot_status_code, :lot_status_description, :isactive)
    end
end
