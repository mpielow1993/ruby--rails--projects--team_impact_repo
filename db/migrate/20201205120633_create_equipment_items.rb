class CreateEquipmentItems < ActiveRecord::Migration[6.0]
  def change
    create_table :equipment_items do |t|
      t.string :name
      t.references :programme_lesson_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
