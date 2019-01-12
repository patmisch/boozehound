class CreateConsumedDrinks < ActiveRecord::Migration[5.2]
  def change
    create_table :consumed_drinks do |t|
      t.integer :user_id
      t.integer :drink_id
      t.integer :price_paid
      t.integer :amount_consumed
      t.integer :next_day_condition

      t.timestamps
    end
  end
end
