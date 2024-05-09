require "administrate/base_dashboard"

class TreasureDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    answer: Field::Text,
    code: Field::String,
    hint: Field::Text,
    photo: Field::ActiveStorage,
    name: Field::Text.with_options(searchable: true),
    question: Field::Text,
    route_points: Field::HasMany,
    discovered_by_teams: Field::HasMany,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    photo
    name
    discovered_by_teams
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    name
    code
    photo
    hint
    question
    answer
    discovered_by_teams
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    photo
    name
    hint
    question
    answer
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how treasures are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(treasure)
  #   "Treasure ##{treasure.id}"
  # end

  def display_resource(treasure)
    "#{treasure.name} (#{treasure.id})"
  end
end
