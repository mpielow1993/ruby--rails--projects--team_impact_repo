class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :user_name
      t.string :first_name
      t.string :last_name
      t.string :phone_no
      t.string :avatar

      t.timestamps
    end
  end
end
