class CreateQuarters < ActiveRecord::Migration[7.0]
  def change
    create_table :quarters do |t|
      t.datetime :started_at
      t.date :ended_at

      t.references :semester, null: false, foreign_key: true
    end
  end
end
