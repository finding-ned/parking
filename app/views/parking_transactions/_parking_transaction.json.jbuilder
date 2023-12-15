json.extract! parking_transaction, :id, :transaction_refno, :transaction_vehicle_type, :transaction_starttime, :transaction_endtime, :isactive, :created_at, :updated_at
json.url parking_transaction_url(parking_transaction, format: :json)
