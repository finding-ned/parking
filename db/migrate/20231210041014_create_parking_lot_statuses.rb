class CreateParkingLotStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :parking_lot_statuses do |t|
      t.integer :lot_status_refno
      t.string :lot_status_code
      t.string :lot_status_description
      t.boolean :isactive

      t.timestamps
    end
  end
end
