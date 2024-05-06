class Treasure < ApplicationRecord
  has_many :route_points, dependent: :destroy
  has_many :discovered_by_teams, -> { where(route_points: {state: :discovered}) }, through: :route_points, source: :team
  has_one_attached :photo
end
