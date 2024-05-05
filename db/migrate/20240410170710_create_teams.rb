class CreateTeams < ActiveRecord::Migration[7.1]
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.uuid :code, null: false, default: "gen_random_uuid()"

      t.timestamps
    end

    add_index :teams, :name, unique: true
    add_index :teams, :code, unique: true
  end
end
