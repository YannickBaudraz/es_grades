class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :slug
      t.string :name

      t.references :category, null: false, foreign_key: true
    end
  end
end
