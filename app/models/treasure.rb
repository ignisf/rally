class Treasure < ApplicationRecord
  has_many :treasure_discoveries, dependent: :destroy
  has_many :route_points, dependent: :destroy

  has_one_attached :photo
end
