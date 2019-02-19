class AddVerdictToConsumedDrink < ActiveRecord::Migration[5.2]
  def change
    add_column :consumed_drinks, :verdict, :integer
  end
end
