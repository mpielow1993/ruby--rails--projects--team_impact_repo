class CreateInstructors < ActiveRecord::Migration[6.0]
  def change
    create_table :instructors do |t|
      t.string :first_name
      t.string :last_name
      t.string :instructor_avatar
      t.timestamps
    end
  end
end
