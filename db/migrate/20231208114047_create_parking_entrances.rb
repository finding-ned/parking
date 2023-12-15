class CreateParkingEntrances < ActiveRecord::Migration[5.2]
  def change
    create_table :parking_entrances do |t|
      t.integer :entrace_refno
      t.string :entrance_description
      t.boolean :isactive

      t.timestamps
    end
  end
end
