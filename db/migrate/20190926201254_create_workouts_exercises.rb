class CreateWorkoutsExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises_workouts do |t|
      t.integer :workout_id
      t.integer :exercise_id

      t.timestamps
    end
  end
end
