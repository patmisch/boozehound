class AddSingleDrinkNameToPurchaseSize < ActiveRecord::Migration[5.2]
  def change
    add_column :purchase_sizes, :single_serving_name, :string
    add_column :purchase_sizes, :single_serving_amount, :float
  end
end
