class ParkingVehiclesController < ApplicationController
  before_action :set_parking_vehicle, only: %i[ show edit update destroy ]

  # GET /parking_vehicles or /parking_vehicles.json
  def index
    @parking_vehicles = ParkingVehicle.all
  end

  # GET /parking_vehicles/1 or /parking_vehicles/1.json
  def show
  end

  # GET /parking_vehicles/new
  def new
    @parking_vehicle = ParkingVehicle.new
  end

  # GET /parking_vehicles/1/edit
  def edit
  end

  # POST /parking_vehicles or /parking_vehicles.json
  def create
    @parking_vehicle = ParkingVehicle.new(parking_vehicle_params)

    respond_to do |format|
      if @parking_vehicle.save
        format.html { redirect_to parking_vehicle_url(@parking_vehicle), notice: "Parking vehicle was successfully created." }
        format.json { render :show, status: :created, location: @parking_vehicle }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @parking_vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parking_vehicles/1 or /parking_vehicles/1.json
  def update
    respond_to do |format|
      if @parking_vehicle.update(parking_vehicle_params)
        format.html { redirect_to parking_vehicle_url(@parking_vehicle), notice: "Parking vehicle was successfully updated." }
        format.json { render :show, status: :ok, location: @parking_vehicle }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @parking_vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parking_vehicles/1 or /parking_vehicles/1.json
  def destroy
    @parking_vehicle.destroy

    respond_to do |format|
      format.html { redirect_to parking_vehicles_url, notice: "Parking vehicle was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parking_vehicle
      @parking_vehicle = ParkingVehicle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def parking_vehicle_params
      params.require(:parking_vehicle).permit(:vehicle_refno, :vehicle_description, :vehicle_typerefno)
    end
end
