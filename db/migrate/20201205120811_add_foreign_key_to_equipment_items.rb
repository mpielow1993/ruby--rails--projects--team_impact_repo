class AddForeignKeyToEquipmentItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :equipment_items, :equipment_status, null: true, foreign_key: true
  end
end
