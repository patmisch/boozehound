require "administrate/base_dashboard"

class PurchaseSizeDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    drink_category: Field::BelongsTo,
    id: Field::Number,
    name: Field::String,
    units: Field::Number.with_options(decimals: 2),
    unit_type: Field::String,
    single_serving_name: Field::String,
    single_serving_amount: Field::Number.with_options(decimals: 2),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :drink_category,
    :id,
    :name,
    :units,
    :unit_type,
    :single_serving_amount,
    :single_serving_name,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :drink_category,
    :id,
    :name,
    :units,
    :unit_type,
    :single_serving_amount,
    :single_serving_name,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :drink_category,
    :name,
    :units,
    :single_serving_amount,
    :single_serving_name,
    :unit_type,
  ].freeze

  # Overwrite this method to customize how purchase sizes are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(purchase_size)
    "PurchaseSize ##{purchase_size.name}"
  end
end
