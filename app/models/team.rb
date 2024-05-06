class Team < ApplicationRecord
  has_many :treasure_discoveries, -> { where.not(answered_at: nil) }, dependent: :destroy
  has_many :treasure_skips, -> { where.not(skipped_at: nil) }, dependent: :destroy, class_name: "TreasureDiscovery"
  has_many :route_points, dependent: :destroy
  has_many :discovered_treasures, through: :treasure_discoveries, class_name: "Treasure", source: :treasure
  has_many :skipped_treasures, through: :treasure_skips, class_name: "Treasure", source: :treasure

  has_one_attached :avatar
end
