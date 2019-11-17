class CreateRegistrations < ActiveRecord::Migration[6.0]
  def change
    create_table :registrations do |t|
      t.references :lesson, null: false, foreign_key: true
      t.references :subscription, null: false, foreign_key: true
      t.date :lesson_date

      t.timestamps
    end
    add_index :registrations, [:lesson_id, :subscription_id], unique: true
  end
end
