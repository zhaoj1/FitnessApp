class CreateCharities < ActiveRecord::Migration[6.0]
  def change
    create_table :charities do |t|
      t.string :charity_name
      t.integer :amount_donated

      t.timestamps
    end
  end
end
