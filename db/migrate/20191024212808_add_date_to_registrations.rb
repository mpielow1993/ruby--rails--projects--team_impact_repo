class AddDateToRegistrations < ActiveRecord::Migration[6.0]
  def change
    add_column :registrations, :lesson_date, :date
  end
end
