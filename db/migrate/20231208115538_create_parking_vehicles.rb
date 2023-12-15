class CreateParkingVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :parking_vehicles do |t|
      t.integer :vehicle_refno
      t.string :vehicle_description
      t.integer :vehicle_typerefno

      t.timestamps
    end
  end
end
