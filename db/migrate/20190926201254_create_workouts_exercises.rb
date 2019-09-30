class CreateWorkoutsExercises < ActiveRecord::Migration[6.0]
  def change
    create_join_table :exercises, :workouts
  end
end
