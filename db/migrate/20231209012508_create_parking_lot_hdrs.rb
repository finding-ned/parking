class CreateParkingLotHdrs < ActiveRecord::Migration[5.2]
  def change
    create_table :parking_lot_hdrs do |t|
      t.integer :lot_hdr_refno
      t.string :lot_hdr_code
      t.string :lot_hdr_description
      t.boolean :isactive

      t.timestamps
    end
  end
end
