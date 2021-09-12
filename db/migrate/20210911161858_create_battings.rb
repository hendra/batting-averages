class CreateBattings < ActiveRecord::Migration[6.0]
  def change
    create_table :battings do |t|
      t.string  :player_id
      t.string  :team_id
      t.integer :year_id
      t.integer :stint
      t.integer :ab
      t.integer :h

      t.timestamps
    end
  end
end
