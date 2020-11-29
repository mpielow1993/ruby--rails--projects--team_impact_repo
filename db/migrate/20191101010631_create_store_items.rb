class CreateStoreItems < ActiveRecord::Migration[6.0]
  def change
    create_table :store_items do |t|
      t.string :type
      t.string :name
      t.string :description
      t.decimal :price
      t.string :avatar

      t.timestamps
    end
  end
end
