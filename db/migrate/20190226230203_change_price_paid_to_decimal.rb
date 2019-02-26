class ChangePricePaidToDecimal < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      change_table :consumed_drinks do |t|
        dir.up   { t.change :price_paid, :decimal, :precision => 8, :scale => 2 }
        dir.down { t.change :price_paid, :integer }
      end
    end
  end
end
