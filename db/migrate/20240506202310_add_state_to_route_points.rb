class AddStateToRoutePoints < ActiveRecord::Migration[7.1]
  def change
    add_column :route_points, :state, :integer, null: false, default: 0
    add_index :route_points, :state
  end
end
