class ParkingLevelsController < ApplicationController
  before_action :set_parking_level, only: %i[ show edit update destroy ]

  # GET /parking_levels or /parking_levels.json
  def index
    @parking_levels = ParkingLevel.all
  end

  # GET /parking_levels/1 or /parking_levels/1.json
  def show
  end

  # GET /parking_levels/new
  def new
    @parking_level = ParkingLevel.new
  end

  # GET /parking_levels/1/edit
  def edit
  end

  # POST /parking_levels or /parking_levels.json
  def create
    @parking_level = ParkingLevel.new(parking_level_params)

    respond_to do |format|
      if @parking_level.save
        format.html { redirect_to parking_level_url(@parking_level), notice: "Parking level was successfully created." }
        format.json { render :show, status: :created, location: @parking_level }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @parking_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parking_levels/1 or /parking_levels/1.json
  def update
    respond_to do |format|
      if @parking_level.update(parking_level_params)
        format.html { redirect_to parking_level_url(@parking_level), notice: "Parking level was successfully updated." }
        format.json { render :show, status: :ok, location: @parking_level }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @parking_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parking_levels/1 or /parking_levels/1.json
  def destroy
    @parking_level.destroy

    respond_to do |format|
      format.html { redirect_to parking_levels_url, notice: "Parking level was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parking_level
      @parking_level = ParkingLevel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def parking_level_params
      params.require(:parking_level).permit(:level_refno, :level_code, :level_description, :isactive)
    end
end
