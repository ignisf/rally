class CreateRoutePoints < ActiveRecord::Migration[7.1]
  def change
    create_table :route_points do |t|
      t.references :team, null: false, foreign_key: true
      t.references :treasure, null: false, foreign_key: true
      t.integer :position, null: false

      t.timestamps
    end

    add_index :route_points, [:team_id, :treasure_id, :position], unique: true
  end
end
