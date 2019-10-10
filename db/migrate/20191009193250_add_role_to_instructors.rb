class AddRoleToInstructors < ActiveRecord::Migration[6.0]
  def change
    add_column :instructors, :role, :string
  end
end
