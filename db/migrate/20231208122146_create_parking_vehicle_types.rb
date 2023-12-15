class CreateParkingVehicleTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :parking_vehicle_types do |t|
      t.integer :vehicle_type_refno
      t.string :vehicle_type_description
      t.integer :vehicle_type_amount
      t.boolean :isactive

      t.timestamps
    end
  end
end
