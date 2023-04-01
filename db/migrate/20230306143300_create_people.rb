class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :type, null: false
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :address

      t.references :city, foreign_key: true
    end
  end
end
