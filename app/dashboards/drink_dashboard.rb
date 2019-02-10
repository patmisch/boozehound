require "administrate/base_dashboard"

class DrinkDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    producer: Field::BelongsTo,
    id: Field::Number,
    name: Field::String,
    drink_category_id: Field::Number,
    abv: Field::Number.with_options(decimals: 2),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :producer,
    :id,
    :name,
    :drink_category_id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :producer,
    :id,
    :name,
    :drink_category_id,
    :abv,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :producer,
    :name,
    :drink_category_id,
    :abv,
  ].freeze

  # Overwrite this method to customize how drinks are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(drink)
  #   "Drink ##{drink.id}"
  # end
end
