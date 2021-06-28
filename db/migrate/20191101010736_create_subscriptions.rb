class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.string :subscription_name
      t.references :membership, null: false, foreign_key: false
      t.references :member, null: false, foreign_key: true
      t.datetime :expiry_date, default: nil
      t.boolean :is_active, default: true
      t.string :registration_limit, default: "Unlimited"

      t.timestamps
    end
    add_foreign_key :subscriptions, :store_items, column: :membership_id
  end
end
