class CreateParkingBlocks < ActiveRecord::Migration[5.2]
  def change
    create_table :parking_blocks do |t|
      t.integer :block_refno
      t.string :block_code
      t.string :block_description
      t.integer :space_refno
      t.integer :level_refno
      t.boolean :isactive

      t.timestamps
    end
  end
end
