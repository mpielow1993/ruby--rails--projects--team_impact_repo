class AddIndexToMembersUserName < ActiveRecord::Migration[6.0]
  def change
    add_index :members, :user_name, unique: true
  end
end
