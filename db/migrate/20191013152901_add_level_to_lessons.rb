class AddLevelToLessons < ActiveRecord::Migration[6.0]
  def change
    add_column :lessons, :level, :string
  end
end
