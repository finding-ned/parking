class CreateParkingSpaces < ActiveRecord::Migration[5.2]
  def change
    create_table :parking_spaces do |t|
      t.integer :space_refno
      t.string :space_description
      t.boolean :isactive

      t.timestamps
    end
  end
end
