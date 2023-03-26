class CreateAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :assignments do |t|
      t.references :teacher, null: false, foreign_key: { to_table: :people }
      t.references :course, null: false, foreign_key: true
    end
  end
end
