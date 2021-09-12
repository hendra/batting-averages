require 'csv'

namespace :import do
  desc "Import Battings"
  task battings: [ :environment ] do
    Batting.in_batches(of: 10000).destroy_all
    file = File.join(Rails.root, 'doc', 'Batting.csv')
    records = []
    CSV.foreach(file, headers: true) do |row|
      records << Batting.new({
        player_id: row[0],
        year_id: row[1].to_i,
        team_id: row[3],
        stint: row[2].to_i,
        ab: row[6].to_i,
        h: row[8].to_i
      })
    end
    Batting.import records
  end
end
