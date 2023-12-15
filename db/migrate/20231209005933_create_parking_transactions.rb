class CreateParkingTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :parking_transactions do |t|
      t.integer :transaction_refno
      t.integer :transaction_vehicle_type
      t.datetime :transaction_starttime
      t.datetime :transaction_endtime
      t.boolean :isactive

      t.timestamps
    end
  end
end
