class ConsumedDrink < ApplicationRecord
  belongs_to :user
  belongs_to :purchase_size
  belongs_to :drink
end
