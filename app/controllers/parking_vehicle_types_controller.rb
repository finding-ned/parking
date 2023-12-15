class ParkingVehicleTypesController < ApplicationController
  before_action :set_parking_vehicle_type, only: %i[ show edit update destroy ]

  # GET /parking_vehicle_types or /parking_vehicle_types.json
  def index
    @parking_vehicle_types = ParkingVehicleType.all
  end

  # GET /parking_vehicle_types/1 or /parking_vehicle_types/1.json
  def show
  end

  # GET /parking_vehicle_types/new
  def new
    @parking_vehicle_type = ParkingVehicleType.new
  end

  # GET /parking_vehicle_types/1/edit
  def edit
  end

  # POST /parking_vehicle_types or /parking_vehicle_types.json
  def create
    @parking_vehicle_type = ParkingVehicleType.new(parking_vehicle_type_params)

    respond_to do |format|
      if @parking_vehicle_type.save
        format.html { redirect_to parking_vehicle_type_url(@parking_vehicle_type), notice: "Parking vehicle type was successfully created." }
        format.json { render :show, status: :created, location: @parking_vehicle_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @parking_vehicle_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parking_vehicle_types/1 or /parking_vehicle_types/1.json
  def update
    respond_to do |format|
      if @parking_vehicle_type.update(parking_vehicle_type_params)
        format.html { redirect_to parking_vehicle_type_url(@parking_vehicle_type), notice: "Parking vehicle type was successfully updated." }
        format.json { render :show, status: :ok, location: @parking_vehicle_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @parking_vehicle_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parking_vehicle_types/1 or /parking_vehicle_types/1.json
  def destroy
    @parking_vehicle_type.destroy

    respond_to do |format|
      format.html { redirect_to parking_vehicle_types_url, notice: "Parking vehicle type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parking_vehicle_type
      @parking_vehicle_type = ParkingVehicleType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def parking_vehicle_type_params
      params.require(:parking_vehicle_type).permit(:vehicle_type_refno, :vehicle_type_description, :vehicle_type_amount, :isactive, :vehicle_code)
    end
end
