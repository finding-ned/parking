class ParkingLotDtlsController < ApplicationController
  before_action :set_parking_lot_dtl, only: %i[ show edit update destroy ]

  # GET /parking_lot_dtls or /parking_lot_dtls.json
  def index
    #@get_url_valuex = request.original_url
    @hash_url = request.params
    @lot_hdr_refno = @hash_url[:lot_hdr_refno]
    @parking_lot_dtls = ParkingLotDtl.where(isactive: 1, lot_hdr_refno: @lot_hdr_refno )
    render :layout => false
  end

  # GET /parking_lot_dtls/1 or /parking_lot_dtls/1.json
  def show
  end

  # GET /parking_lot_dtls/new
  def new
    @hash_url_new = request.params
    @lot_hdr_refno_new = @hash_url_new[:lot_hdr_refno_new]
    @parking_lot_dtl = ParkingLotDtl.new
    render :layout => false
  end

  # GET /parking_lot_dtls/1/edit
  def edit
  end

  # POST /parking_lot_dtls or /parking_lot_dtls.json
  def create
    @parking_lot_dtl = ParkingLotDtl.new(parking_lot_dtl_params)
    @check_if_exist = ParkingLotDtl.where(lot_hdr_refno: @parking_lot_dtl.lot_hdr_refno, entrance_refno: @parking_lot_dtl.entrance_refno, distance: @parking_lot_dtl.distance).exists?

    respond_to do |format|
      if @check_if_exist == true
        flash[:notice] = "Welcome Admin!" 
        format.html { redirect_to "/parking_lot_dtls/new?lot_hdr_refno_new=#{@parking_lot_dtl.lot_hdr_refno}", notice: "Record alredy exists."}
        #format.json { render json: @parking_lot_dtl.errors, status: :unprocessable_entity }
        flash[:notice] = "Welcome Admin!" 
      else

        if @parking_lot_dtl.save
          #ActiveRecord::Base.connection.exec_query("update parking_lot_dtls set lot_detail_refno =  #{@parking_lot_dtl} where id = 1")

          format.html { redirect_to "/parking_lot_dtls?lot_hdr_refno=#{@parking_lot_dtl.lot_hdr_refno}", notice: "Record successfully created. #{@parking_lot_dtl.lot_hdr_refno} / #{@heck_if_exist} / #{@parking_lot_dtl.lot_hdr_refno}/ #{@parking_lot_dtl.entrance_refno} / #{@parking_lot_dtl.distance}" }
          format.json { render :show, status: :created, location: @parking_lot_dtl }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @parking_lot_dtl.errors, status: :unprocessable_entity }
        end

      end 

    end
  end

  # PATCH/PUT /parking_lot_dtls/1 or /parking_lot_dtls/1.json
  def update
    respond_to do |format|
      if @parking_lot_dtl.update(parking_lot_dtl_params)
        format.html { redirect_to parking_lot_dtl_url(@parking_lot_dtl), notice: "Parking lot dtl was successfully updated." }
        format.json { render :show, status: :ok, location: @parking_lot_dtl }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @parking_lot_dtl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parking_lot_dtls/1 or /parking_lot_dtls/1.json
  def destroy
    @parking_lot_dtl.destroy

    respond_to do |format|
      format.html { redirect_to parking_lot_dtls_url, notice: "Parking lot dtl was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parking_lot_dtl
      @parking_lot_dtl = ParkingLotDtl.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def parking_lot_dtl_params
      params.require(:parking_lot_dtl).permit(:lot_detail_refno, :lot_hdr_refno, :lot_dtl_description, :entrance_refno, :distance, :isactive)
    end
end
