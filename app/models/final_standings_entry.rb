class FinalStandingsEntry < ApplicationRecord
  self.primary_key = :place
  belongs_to :team
end
