# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

file = File.join(Rails.root, 'doc', 'Teams.csv')

CSV.foreach(file, headers: true) do |row|
  Team.create({
    year_id: row[0].to_i,
    lg_id:   row[1],
    team_id: row[2],
    franch_id: row[3],
    div_id: row[4],
    rank: row[5].to_i,
    ghome: row[6].nil? ? nil : row[6].to_i,
    div_win: row[7].nil? ? nil : (row[7].eql?('Y') ? true : false),
    wc_win: row[8].nil? ? nil : (row[7].eql?('Y') ? true : false),
    lg_win: row[9].nil? ? nil : (row[7].eql?('Y') ? true : false),
    ws_win: row[10].nil? ? nil : (row[7].eql?('Y') ? true : false),
    name: row[11],
    park: row[12],
    attendance: row[13].nil? ? nil : row[13].to_i,
    bpf: row[14].to_i,
    ppf: row[15].to_i,
    team_id_br: row[16],
    team_id_lahman45: row[17],
    team_id_retro: row[18]
  })
end
