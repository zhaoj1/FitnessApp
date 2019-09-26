class CreateDiets < ActiveRecord::Migration[6.0]
  def change
    create_table :diets do |t|
      t.string :meal
      t.integer :calories
      t.integer :user_id

      t.timestamps
    end
  end
end
