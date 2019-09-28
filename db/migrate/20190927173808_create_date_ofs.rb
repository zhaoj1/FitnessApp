class CreateDateOfs < ActiveRecord::Migration[6.0]
  def change
    create_table :date_ofs do |t|
      t.date :date_of
      t.integer :user_id

      t.timestamps
    end
  end
end
