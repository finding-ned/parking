class ParkingSettingsController < ApplicationController
  before_action :set_parking_setting, only: %i[ show edit update destroy ]

  # GET /parking_settings or /parking_settings.json
  def index
    @parking_settings = ParkingSetting.all
     
  end

  # GET /parking_settings/1 or /parking_settings/1.json
  def show
  end

  # GET /parking_settings/new
  def new
    @parking_setting = ParkingSetting.new
  end

  # GET /parking_settings/1/edit
  def edit
  end

  # POST /parking_settings or /parking_settings.json
  def create
    @parking_setting = ParkingSetting.new(parking_setting_params)

    respond_to do |format|
      if @parking_setting.save
        format.html { redirect_to parking_setting_url(@parking_setting), notice: "Parking setting was successfully created." }
        format.json { render :show, status: :created, location: @parking_setting }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @parking_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parking_settings/1 or /parking_settings/1.json
  def update
    respond_to do |format|
      if @parking_setting.update(parking_setting_params)
        format.html { redirect_to parking_setting_url(@parking_setting), notice: "Parking setting was successfully updated." }
        format.json { render :show, status: :ok, location: @parking_setting }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @parking_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parking_settings/1 or /parking_settings/1.json
  def destroy
    @parking_setting.destroy

    respond_to do |format|
      format.html { redirect_to parking_settings_url, notice: "Parking setting was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parking_setting
      @parking_setting = ParkingSetting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def parking_setting_params
      params.require(:parking_setting).permit(:setting_refno, :setting_code, :setting_description, :setting_value, :isactive)
    end
end
