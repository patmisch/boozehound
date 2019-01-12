class CreateDrinks < ActiveRecord::Migration[5.2]
  def change
    create_table :drinks do |t|
      t.string :name
      t.integer :drink_category_id
      t.integer :producer_id
      t.float :abv

      t.timestamps
    end
  end
end
