class Team < ApplicationRecord
  has_many :treasure_discoveries, dependent: :destroy
  has_many :route_points, dependent: :destroy
  has_many :discovered_treasures, through: :treasure_discoveries, class_name: "Treasure", source: :treasure
end
