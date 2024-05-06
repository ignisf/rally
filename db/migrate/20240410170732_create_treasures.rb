class CreateTreasures < ActiveRecord::Migration[7.1]
  def change
    create_table :treasures do |t|
      t.text :name, null: false
      t.text :hint, null: false
      t.text :question, null: false
      t.text :answer, null: false
      t.uuid :code, null: false, default: "gen_random_uuid()"

      t.timestamps
    end
    add_index :treasures, :code, unique: true
  end
end
