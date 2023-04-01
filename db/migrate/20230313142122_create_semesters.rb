class CreateSemesters < ActiveRecord::Migration[7.0]
  def change
    create_table :semesters do |t|
      t.datetime :started_at
      t.datetime :ended_at
    end
  end
end
