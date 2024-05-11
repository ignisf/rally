class UpdateFinalStandingsEntriesToVersion2 < ActiveRecord::Migration[7.1]
  def change
    update_view :final_standings_entries, version: 2, revert_to_version: 1
  end
end
