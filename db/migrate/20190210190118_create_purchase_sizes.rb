class CreatePurchaseSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_sizes do |t|
      t.string :name
      t.float :units
      t.string :unit_type
      t.integer :drink_category_id

      t.timestamps
    end
  end
end
