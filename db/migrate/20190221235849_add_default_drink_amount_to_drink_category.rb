class AddDefaultDrinkAmountToDrinkCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :drink_categories, :single_drink_name, :string
  end
end
