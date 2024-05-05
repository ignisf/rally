class Treasure < ApplicationRecord
  has_many :treasure_discoveries, dependent: :destroy
  has_many :route_points, dependent: :destroy
end
