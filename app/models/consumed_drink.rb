class ConsumedDrink < ApplicationRecord
  belongs_to :user
  belongs_to :purchase_size, optional: true
  belongs_to :drink
end
