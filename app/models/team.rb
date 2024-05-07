class Team < ApplicationRecord
  # has_many :treasure_discoveries, -> { where.not(answered_at: nil) }, dependent: :destroy
  # has_many :treasure_skips, -> { where.not(skipped_at: nil) }, dependent: :destroy, class_name: "TreasureDiscovery"
  # has_many :discovered_treasures, through: :treasure_discoveries, class_name: "Treasure", source: :treasure
  # has_many :skipped_treasures, through: :treasure_skips, class_name: "Treasure", source: :treasure

  has_many :route_points, dependent: :destroy
  has_many :route_points_left_to_discover, -> { where(state: [:undiscovered, :discovered_but_not_answered]) }, class_name: "RoutePoint"

  has_many :treasures_left_to_discover, through: :route_points_left_to_discover, source: :treasure
  has_many :discovered_treasures, -> { where(route_points: {state: :discovered}) }, through: :route_points, source: :treasure
  has_many :skipped_treasures, -> { where(route_points: {state: :skipped}) }, through: :route_points, source: :treasure

  # has_many :discovered_treasures, -> { where(treasure_states: {state: :discovered}) }, through: :treasure_states, class_name: "Treasure", source: :treasure
  # has_many :treasures_left_to_discover, -> { where(treasure_states: {state: [:undiscovered, :discovered_but_not_answered]}) }, through: :treasure_states, class_name: "Treasure", source: :treasure
  # has_many :skipped_treasures, -> { where(treasure_states: {state: :skipped}) }, through: :treasure_states, class_name: "Treasure", source: :treasure
  # has_many :route_points_left_to_visit, -> { order(position: :asc) }, through: :treasures_left_to_discover, class_name: "RoutePoint", source: :route_points

  has_one_attached :avatar

  def next_treasure
    route_points_left_to_discover.includes(:treasure).order(position: :asc).first.treasure
  end
end
