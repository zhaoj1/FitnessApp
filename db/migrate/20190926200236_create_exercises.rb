class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :muscle
      t.string :equipment
      t.string :difficulty

      t.timestamps
    end
  end
end
