class CreateProgrammes < ActiveRecord::Migration[6.0]
  def change
    create_table :programmes do |t|
      t.string :name
      t.string :avatar
      t.string :quotation
      t.timestamps
    end
  end
end
