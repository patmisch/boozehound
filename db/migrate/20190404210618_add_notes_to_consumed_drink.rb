class AddNotesToConsumedDrink < ActiveRecord::Migration[5.2]
  def change
    add_column :consumed_drinks, :notes, :text
  end
end
