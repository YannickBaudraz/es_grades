class CreatePromotions < ActiveRecord::Migration[7.0]
  def change
    create_table :promotions do |t|
      t.string :name
      t.datetime :started_at
      t.datetime :ended_at
    end
  end
end
