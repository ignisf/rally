class CreateTreasureDiscoveries < ActiveRecord::Migration[7.1]
  def change
    create_table :treasure_discoveries do |t|
      t.references :team, null: false, foreign_key: true
      t.references :treasure, null: false, foreign_key: true
      t.timestamptz :discovered_at, null: false
      t.timestamptz :skipped_at
      t.timestamptz :answered_at

      t.timestamps
    end

    add_index :treasure_discoveries, [:team_id, :treasure_id], unique: true
  end
end
