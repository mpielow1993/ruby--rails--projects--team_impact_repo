class CreateProgrammeLessonTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :programme_lesson_types do |t|
      t.references :programme, null: false, foreign_key: true
      t.references :lesson_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
