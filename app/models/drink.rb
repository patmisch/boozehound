class Drink < ApplicationRecord
  include PgSearch
  pg_search_scope :search_by_name, :against => :name,
    using: {
      tsearch: {
        prefix: true
      } 
    }
  
  pg_search_scope :search_by_name_and_producer, against: :name, associated_against: {
    producer: :name
  },
  using: {
    tsearch: {
      prefix: true
    }
  }
  

  belongs_to :producer
end
