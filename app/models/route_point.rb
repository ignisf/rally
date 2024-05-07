class RoutePoint < ApplicationRecord
  belongs_to :team
  belongs_to :treasure

  enum state: {undiscovered: 0, discovered_but_not_answered: 1, skipped: 2, discovered: 3}

  validates :discovered_at, presence: true, if: -> { state == :discovered }

  broadcasts_refreshes_to :team
end
