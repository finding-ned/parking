class ParkingEntrancesController < ApplicationController
  before_action :set_parking_entrance, only: %i[ show edit update destroy ]

  # GET /parking_entrances or /parking_entrances.json
  def index
    @parking_entrances = ParkingEntrance.all
  end

  # GET /parking_entrances/1 or /parking_entrances/1.json
  def show
  end

  # GET /parking_entrances/new
  def new
    @parking_entrance = ParkingEntrance.new
  end

  # GET /parking_entrances/1/edit
  def edit
  end

  # POST /parking_entrances or /parking_entrances.json
  def create
    @parking_entrance = ParkingEntrance.new(parking_entrance_params)

    respond_to do |format|
      if @parking_entrance.save
        format.html { redirect_to parking_entrance_url(@parking_entrance), notice: "Parking entrance was successfully created." }
        format.json { render :show, status: :created, location: @parking_entrance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @parking_entrance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parking_entrances/1 or /parking_entrances/1.json
  def update
    respond_to do |format|
      if @parking_entrance.update(parking_entrance_params)
        format.html { redirect_to parking_entrance_url(@parking_entrance), notice: "Parking entrance was successfully updated." }
        format.json { render :show, status: :ok, location: @parking_entrance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @parking_entrance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parking_entrances/1 or /parking_entrances/1.json
  def destroy
    @parking_entrance.destroy

    respond_to do |format|
      format.html { redirect_to parking_entrances_url, notice: "Parking entrance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parking_entrance
      @parking_entrance = ParkingEntrance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def parking_entrance_params
      params.require(:parking_entrance).permit(:entrace_refno, :entrance_description, :isactive)
    end
end
