class CreateExams < ActiveRecord::Migration[7.0]
  def change
    create_table :exams do |t|
      t.string :name
      t.decimal :weight
      t.datetime :passed_at

      t.references :teacher, null: false, foreign_key: { to_table: :people }
      t.references :course, null: false, foreign_key: true, on_delete: :cascade
    end
  end
end
