class AddResetToMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :reset_digest, :string
    add_column :members, :reset_sent_at, :datetime
  end
end
