class CreateParkingLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :parking_levels do |t|
      t.integer :level_refno
      t.string :level_code
      t.string :level_description
      t.boolean :isactive

      t.timestamps
    end
  end
end
