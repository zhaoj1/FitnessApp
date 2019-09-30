class CreateSleeps < ActiveRecord::Migration[6.0]
  def change
    create_table :sleeps do |t|
      t.integer :hours
      t.integer :date_of_id

      t.timestamps
    end
  end
end
