class CreateStudentSemesters < ActiveRecord::Migration[7.0]
  def change
    create_table :student_semesters do |t|
      t.boolean :conditional

      t.references :student, null: false, foreign_key: { to_table: :people }
      t.references :semester, null: false, foreign_key: true
    end
  end
end
