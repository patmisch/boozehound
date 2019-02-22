class AddYearAndTypeToDrink < ActiveRecord::Migration[5.2]
  def change
    add_column :drinks, :year, :integer
    add_column :drinks, :drink_type_id, :integer
  end
end
