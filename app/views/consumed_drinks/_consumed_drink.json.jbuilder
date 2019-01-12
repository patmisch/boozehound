json.extract! consumed_drink, :id, :user_id, :drink_id, :price_paid, :amount_consumed, :next_day_condition, :created_at, :updated_at
json.url consumed_drink_url(consumed_drink, format: :json)
