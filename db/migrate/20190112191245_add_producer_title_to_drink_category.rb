class AddProducerTitleToDrinkCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :drink_categories, :producer_title, :string
  end
end
