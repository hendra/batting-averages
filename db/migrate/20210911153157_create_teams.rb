class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.integer :year_id
      t.string :lg_id
      t.string :team_id
      t.string :franch_id
      t.string :div_id
      t.integer :rank
      t.integer :ghome
      t.boolean :div_win
      t.boolean :wc_win
      t.boolean :lg_win
      t.boolean :ws_win
      t.string :name
      t.string :park
      t.integer :attendance
      t.integer :bpf
      t.integer :ppf
      t.string :team_id_br
      t.string :team_id_lahman45
      t.string :team_id_retro

      t.timestamps
    end
  end
end
