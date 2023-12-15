class CreateParkingSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :parking_settings do |t|
      t.integer :setting_refno
      t.string :setting_code
      t.string :setting_description
      t.string :setting_value
      t.boolean :isactive

      t.timestamps
    end
  end
end
