class CreateMoods < ActiveRecord::Migration[6.0]
  def change
    create_table :moods do |t|
      t.string :mood_kind
      t.integer :user_id

      t.timestamps
    end
  end
end
