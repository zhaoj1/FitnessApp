class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.string :exercise_name
      t.string :image_url
      t.string :page_url
      t.string :exercise_difficulty
      t.string :exercise_impact_level
      t.string :target_body_parts
      t.string :exercise_video

      t.timestamps
    end
  end
end
