require "administrate/base_dashboard"

class FinalStandingsEntryDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    place: Field::Number,
    discovered_treasures: Field::Number,
    first_treasure_discovered_at: Field::String.with_options(searchable: false),
    last_treasure_discovered_at: Field::String.with_options(searchable: false),
    team: Field::BelongsTo,
    treasure_hunt_time: ::DurationField,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    place
    team
    discovered_treasures
    treasure_hunt_time
    first_treasure_discovered_at
    last_treasure_discovered_at
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    place
    discovered_treasures
    first_treasure_discovered_at
    last_treasure_discovered_at
    team
    treasure_hunt_time
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    place
    discovered_treasures
    first_treasure_discovered_at
    last_treasure_discovered_at
    team
    treasure_hunt_time
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

  # Overwrite this method to customize how final standings entries are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(final_standings_entry)
  #   "FinalStandingsEntry ##{final_standings_entry.id}"
  # end
end
