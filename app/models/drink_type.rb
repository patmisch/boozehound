class DrinkType < ApplicationRecord
  include PgSearch

  pg_search_scope :search_by_name, :against => :name,
    using: {
      tsearch: {
        prefix: true
      } 
    }

  belongs_to :drink_category
  has_many :drinks
end
