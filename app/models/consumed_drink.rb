class ConsumedDrink < ApplicationRecord
  belongs_to :user
  has_one :purchase_size
  belongs_to :drink
end
