class CreateParkingLotDtls < ActiveRecord::Migration[5.2]
  def change
    create_table :parking_lot_dtls do |t|
      t.integer :lot_detail_refno
      t.integer :lot_hdr_refno
      t.string :lot_dtl_description
      t.integer :entrance_refno
      t.integer :distance
      t.boolean :isactive

      t.timestamps
    end
  end
end
