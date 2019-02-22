class CreateDrinkTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :drink_types do |t|
      t.integer :drink_category_id
      t.string :name

      t.timestamps
    end
  end
end
