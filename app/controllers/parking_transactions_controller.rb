class ParkingTransactionsController < ApplicationController
  before_action :set_parking_transaction, only: %i[ show edit update destroy ]

  # GET /parking_transactions or /parking_transactions.json
  def index
    @parking_transactions = ParkingTransaction.all
  end

  # GET /parking_transactions/1 or /parking_transactions/1.json
  def show
  end

  # GET /parking_transactions/new
  def new 
    @hash_url_new = request.params
    @entrance_refno_new = @hash_url_new[:entrance_refno]
    @parking_transaction = ParkingTransaction.new
  end

  # GET /parking_transactions/1/edit
  def edit
  end

  # POST /parking_transactions or /parking_transactions.json
  def create
    @parking_transaction = ParkingTransaction.new(parking_transaction_params)
 
    #@get_lot_hdr_refno = ActiveRecord::Base.connection.exec_query("select lot_hdr_refno from view_parking_lot_dtl_hdr where  lot_status_refno = 1 and entrance_refno = #{@parking_transaction.entrance_refno } order by distance, lot_hdr_refno  limit 1")


    if @parking_transaction.transaction_vehicle_type == 1 # small
            #get nearest and available
      @get_lot_hdr_refno = ViewParkingLotDtlHdr.where(lot_status_refno: 1, entrance_refno: @parking_transaction.entrance_refno).order('distance, lot_hdr_refno').limit(1)

      if @get_lot_hdr_refno.exists? == false
        redirect_to '/parking_entrances' , notice: 'No available parking lot'
      else

        #@get_if_vehicles_size = ParkingLotHdr.where 

        respond_to do |format|
          if @parking_transaction.save

            get_lot_hdr_refno_a = @get_lot_hdr_refno.pluck(:lot_hdr_refno).to_sentence

            get_latest_rec_id = ParkingTransaction.order('id desc').first
            get_latest_rec = ParkingTransaction.order('id desc').first
            get_latest_rec.update(transaction_starttime: DateTime.now + 8.hours , transaction_refno: get_latest_rec_id.id, lot_hdr_refno: get_lot_hdr_refno_a.to_i, entrance_refno:  @parking_transaction.entrance_refno )

            update_lot_hdr = ParkingLotHdr.where(lot_hdr_refno: @get_lot_hdr_refno.pluck(:lot_hdr_refno))
            update_lot_hdr.update(lot_status_refno: 2)


            format.html { redirect_to parking_transaction_url(@parking_transaction), notice: "Parking transaction was successfully created." }
            format.json { render :show, status: :created, location: @parking_transaction }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @parking_transaction.errors, status: :unprocessable_entity }
          end

        end

      end

    elsif @parking_transaction.transaction_vehicle_type == 2 # medium

        #get nearest and available
      @get_lot_hdr_refno = ViewParkingLotDtlHdr.where(lot_status_refno: 1, entrance_refno: @parking_transaction.entrance_refno, vehicle_type_refno: 2..3).order('distance, lot_hdr_refno').limit(1)

      if @get_lot_hdr_refno.exists? == false
        redirect_to '/' , notice: 'No available parking lot'
      else

        #@get_if_vehicles_size = ParkingLotHdr.where 

        respond_to do |format|
          if @parking_transaction.save

            get_lot_hdr_refno_a = @get_lot_hdr_refno.pluck(:lot_hdr_refno).to_sentence

            get_latest_rec_id = ParkingTransaction.order('id desc').first
            get_latest_rec = ParkingTransaction.order('id desc').first
            get_latest_rec.update(transaction_starttime: DateTime.now + 8.hours , transaction_refno: get_latest_rec_id.id, lot_hdr_refno:  get_lot_hdr_refno_a.to_i , entrance_refno:  @parking_transaction.entrance_refno )

            update_lot_hdr = ParkingLotHdr.where(lot_hdr_refno: @get_lot_hdr_refno.pluck(:lot_hdr_refno))
            update_lot_hdr.update(lot_status_refno: 2)


            format.html { redirect_to parking_transaction_url(@parking_transaction), notice: "Parking transaction was successfully created." }
            format.json { render :show, status: :created, location: @parking_transaction }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @parking_transaction.errors, status: :unprocessable_entity }
          end

        end

      end

    else #large

        #get nearest and available
      @get_lot_hdr_refno = ViewParkingLotDtlHdr.where(lot_status_refno: 1, entrance_refno: @parking_transaction.entrance_refno, vehicle_type_refno: 3).order('distance, lot_hdr_refno').limit(1)

      if @get_lot_hdr_refno.exists? == false
        redirect_to '/' , notice: 'No available parking lot'
      else

        #@get_if_vehicles_size = ParkingLotHdr.where 

        respond_to do |format|
          if @parking_transaction.save

            get_lot_hdr_refno_a = @get_lot_hdr_refno.pluck(:lot_hdr_refno).to_sentence

            get_latest_rec_id = ParkingTransaction.order('id desc').first
            get_latest_rec = ParkingTransaction.order('id desc').first
            get_latest_rec.update(transaction_starttime: DateTime.now + 8.hours , transaction_refno: get_latest_rec_id.id, lot_hdr_refno: get_lot_hdr_refno_a.to_i , entrance_refno:  @parking_transaction.entrance_refno )

            update_lot_hdr = ParkingLotHdr.where(lot_hdr_refno: @get_lot_hdr_refno.pluck(:lot_hdr_refno))
            update_lot_hdr.update(lot_status_refno: 2)

            format.html { redirect_to parking_transaction_url(@parking_transaction), notice: "Parking transaction was successfully created." }
            format.json { render :show, status: :created, location: @parking_transaction }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @parking_transaction.errors, status: :unprocessable_entity }
          end

        end

      end

    end

  end

  # PATCH/PUT /parking_transactions/1 or /parking_transactions/1.json
  def update
    respond_to do |format|
      if @parking_transaction.update(parking_transaction_params)
        format.html { redirect_to parking_transaction_url(@parking_transaction), notice: "Parking transaction was successfully updated." }
        format.json { render :show, status: :ok, location: @parking_transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @parking_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parking_transactions/1 or /parking_transactions/1.json
  def destroy
    @parking_transaction.destroy

    respond_to do |format|
      format.html { redirect_to parking_transactions_url, notice: "Parking transaction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def timeout_trans
    @hash_url_trans_timeout = request.params
    @transaction_id = @hash_url_trans_timeout[:transaction_id]

    #get timein
    @get_timein = ParkingTransaction.where(id: @transaction_id).pluck(:transaction_starttime).to_sentence

    #get timeout
    @get_timeout = Time.now.getlocal.utc
    @get_timeout1 = @get_timeout.utc
    @get_timeout2 = @get_timeout1 + 8.hours
    #compute time
    @total_hrs = (@get_timeout2.to_time - @get_timein.to_time ) / 1.hour
    @total_hrs_rounded =  @total_hrs.round.to_i

    #check if exceed on FLAT HOURS
    @get_flathrs_value = ParkingSetting.where(setting_refno: 1).pluck(:setting_value).to_sentence  #get flat hours value

    if @total_hrs_rounded <= @get_flathrs_value.to_i #less than 3hrs
        @message = 'Less than 3hrs'
        @get_vhcle_type = ParkingTransaction.where(id: @transaction_id ).pluck(:transaction_vehicle_type).to_sentence
        @get_vhcle_details = ParkingVehicleType.where(vehicle_type_refno: @get_vhcle_type.to_i)
        @get_vhcle_details_amount = ParkingVehicleType.where(vehicle_type_refno: @get_vhcle_type.to_i).pluck(:vehicle_type_amount).to_sentence
        @get_total_amount = @get_vhcle_details_amount.to_i

    else # over 3hrs
        @message = 'More than flat hour'
        @get_vhcle_type = ParkingTransaction.where(id: @transaction_id ).pluck(:transaction_vehicle_type).to_sentence
        @get_vhcle_details = ParkingVehicleType.where(vehicle_type_refno: @get_vhcle_type.to_i)

        #check if exceed to 24 hrs
        if @total_hrs_rounded  <= 24 #less than or equal to 24hrs
          @message2 = "But less than 24 hours"
          @get_vhcle_details_less_24 = ParkingVehicleType.where(vehicle_type_refno: @get_vhcle_type.to_i).pluck(:vehicle_type_amount).to_sentence
          @get_excess_hrs_on_less_24_1 = @total_hrs_rounded - @get_flathrs_value.to_i #amount of excess
          @get_vehicle_exceed_rate = ParkingVehicleType.where(vehicle_type_refno: @get_vhcle_type.to_i).pluck(:vehicle_exceed_rate).to_sentence#get the excess amt for vhcle type
          @get_excess_of_24 = @get_excess_hrs_on_less_24_1.to_i * @get_vehicle_exceed_rate.to_i
          @get_remaining_3 = @get_vhcle_details_less_24.to_i #amt of remaining 3 hrs

          @get_total_amount = @get_excess_of_24.to_i +  @get_remaining_3.to_i


        else #greater than 24 hrs
          get_charge_value = ParkingSetting.where(setting_refno: 2).pluck(:setting_value).to_sentence #get over 24 hrs charge
          @message2 = "Greater than 24 hours"
          @get_days = @total_hrs / 24
          @get_days_penalty = @get_days.floor.to_i.round * get_charge_value.to_i #get the days penalty

          @get_exceed_hrs = Time.new(2001) + @total_hrs_rounded.hours # get hrs
          @get_exceed_hrs1 = @get_exceed_hrs.strftime('%H')

          if @get_exceed_hrs1.to_i <= @get_flathrs_value.to_i #less than 3hrs on excess
            @message3 = 'With excess less than 3 hours'
            @get_vhcle_details_less_24 = ParkingVehicleType.where(vehicle_type_refno: @get_vhcle_type.to_i).pluck(:vehicle_type_amount).to_sentence
            @get_total_amount1 = @get_vhcle_details_less_24.to_i *  @total_hrs_rounded
            @get_total_amount = @get_total_amount1 + @get_days_penalty
            

          else #greater than 3hrs excess
            @message3 = 'Excess with greater than 3 hours'
            @get_vhcle_details_less_24 = ParkingVehicleType.where(vehicle_type_refno: @get_vhcle_type.to_i).pluck(:vehicle_type_amount).to_sentence
            @get_excess_hrs_on_less_24_1 = @get_exceed_hrs1.to_i - @get_flathrs_value.to_i #amount of excess
            @get_vehicle_exceed_rate = ParkingVehicleType.where(vehicle_type_refno: @get_vhcle_type.to_i).pluck(:vehicle_exceed_rate).to_sentence#get the excess amt for vhcle type
            @get_excess_of_24 = @get_excess_hrs_on_less_24_1.to_i * @get_vehicle_exceed_rate.to_i
            @get_remaining_3 = @get_vhcle_details_less_24.to_i #amt of remaining 3 hrs

            @get_total_amount = @get_excess_of_24.to_i +  @get_remaining_3.to_i + @get_days_penalty.to_i
          end

        end

      
    end
    
 
  end


  def timeout
    @hash_url_timeout = request.params
    @transaction_id_timeout = @hash_url_timeout[:transaction_id]

  end

  def timeout_end
    @hash_url_timeoutend = request.params
    @transaction_id = params[:trans_id]
    get_amount_change = params[:amount_paid].to_i - params[:amount_given].to_i
    park_trans = ParkingTransaction.where(transaction_refno: @transaction_id )
    park_trans.update(amount_paid: params[:amount_paid], amount_given: params[:amount_given], amount_change: get_amount_change, IsEnded: 1)

    get_parking_lot = ParkingTransaction.where(transaction_refno: @transaction_id ).pluck(:lot_hdr_refno)
    get_parking_lot1= ParkingLotHdr.where(lot_hdr_refno: get_parking_lot)
    get_parking_lot1.update(lot_status_refno: 1)

    redirect_to '/'
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parking_transaction
      @parking_transaction = ParkingTransaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def parking_transaction_params
      params.require(:parking_transaction).permit(:transaction_refno, :transaction_vehicle_type, :transaction_starttime, :transaction_endtime, :isactive, :lot_hdr_refno, :entrance_refno, :plate_number, :amount_paid, :amount_change, :amount_given, :IsEnded)
    end
end
