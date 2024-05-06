class AddDiscoveredAtToRoutePoints < ActiveRecord::Migration[7.1]
  def change
    add_column :route_points, :discovered_at, :timestamptz
    add_index :route_points, :discovered_at
  end
end
