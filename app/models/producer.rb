class Producer < ApplicationRecord
  include PgSearch
  multisearchable against: [:name]
  pg_search_scope :search_by_name, :against => :name,
    using: {
      tsearch: {
        prefix: true
      } 
    }
  
  has_many :drinks
end
