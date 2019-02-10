class AddPurchaseSizeToConsumedDrink < ActiveRecord::Migration[5.2]
  def change
    add_column :consumed_drinks, :purchase_size_id, :integer
  end
end
