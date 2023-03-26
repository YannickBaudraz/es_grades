class CreateStudentPromotions < ActiveRecord::Migration[7.0]
  def change
    create_table :student_promotions do |t|
      t.references :promotion, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: { to_table: :people }

      t.datetime :started_at
      t.datetime :ended_at
    end
  end
end
