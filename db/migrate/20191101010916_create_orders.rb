class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :member, null: false, foreign_key: true
      t.decimal :total
      t.boolean :is_paid, default: false
      t.timestamps
    end
  end
end
