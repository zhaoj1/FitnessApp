class CreateWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.string :name
      t.integer :length
      t.date :workout_date
      t.integer :user_id

      t.timestamps
    end
  end
end
