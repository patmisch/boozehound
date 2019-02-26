require "administrate/base_dashboard"

class ConsumedDrinkDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    user: Field::BelongsTo,
    drink: Field::BelongsTo,
    price_paid: Field::Number,
    purchase_size: Field::BelongsTo,
    amount_consumed: Field::Number,
    next_day_condition: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :user,
    :drink,
    :price_paid,
    :purchase_size,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :user,
    :drink,
    :price_paid,
    :purchase_size,
    :amount_consumed,
    :next_day_condition,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :drink,
    :price_paid,
    :purchase_size,
    :amount_consumed,
    :next_day_condition,
  ].freeze

  # Overwrite this method to customize how consumed drinks are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(consumed_drink)
  #   "ConsumedDrink ##{consumed_drink.id}"
  # end
end
