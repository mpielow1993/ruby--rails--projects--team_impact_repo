class AddForeignKeyToEquipmentItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :equipment_items, :equipment_status, null: false, foreign_key: true
  end
end
