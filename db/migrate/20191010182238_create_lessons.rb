class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.references :instructor, null: false, foreign_key: true
      t.references :facility, null: false, foreign_key: true
      t.references :programme, null: false, foreign_key: true

      t.timestamps
    end
  end
end
