class CreateFinalStandingsEntries < ActiveRecord::Migration[7.1]
  def change
    create_view :final_standings_entries
  end
end
