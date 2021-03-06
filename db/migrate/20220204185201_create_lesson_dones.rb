class CreateLessonDones < ActiveRecord::Migration[6.0]
  def change
    create_table :lesson_dones do |t|
      t.references :lesson, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :done

      t.timestamps
    end
  end
end
