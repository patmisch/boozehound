class ConsumedDrink < ApplicationRecord
  belongs_to :user
  has_one :purchase_size
end
