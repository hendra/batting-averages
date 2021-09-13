module BattingsHelper
  def batting_years
    Batting.distinct.pluck(:year_id)
  end

  def team_names
    Team.order(:name).distinct.pluck(:name, :team_id)
  end
  
  def formatted_team_names(batting)
    tids = batting.tids.split(',')
    names = []
    tids.each do |tid|
      names << Team.where(team_id: tid).first.name
    end
    names.join(', ')
  end
  
end
