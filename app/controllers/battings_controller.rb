require 'csv'

class BattingsController < ApplicationController

  def index
    conditions = {}
    conditions[:year_id] = params[:year] if params[:year].present?
    conditions[:team_id] = params[:team_id] if params[:team_id].present?
    sql = "*, SUM(ab) AS total_ab, SUM(h) AS total_h, GROUP_CONCAT(team_id, ',') AS tids, (CAST(SUM(h) AS float)/CAST(SUM(ab) AS float)) AS ba"
    @battings = Batting.where(conditions)
                        .group(:player_id, :year_id)
                        .select(sql)
                        .order('ba ASC')
                        .page(params[:page])
  end

  def create
    Batting.in_batches(of: 10000).destroy_all
    csv_text = File.read(params[:attachment].tempfile)
    records = []
    CSV.parse(csv_text, headers: true) do |row|
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
    redirect_to '/battings', notice: "Batting was successfully created."
  end
end
