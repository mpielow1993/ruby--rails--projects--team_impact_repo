class AddRoleToInstructors < ActiveRecord::Migration[6.0]
  def change
    add_column :instructors, :instructor_role, :string
  end
end
