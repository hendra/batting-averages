module BattingsHelper
  def batting_start_year
    Batting.distinct.pluck(:year_id).min
  end
  
  def batting_end_year
    Batting.distinct.pluck(:year_id).max
  end

  def team_names
    Team.order(:name).distinct.pluck(:name, :team_id)
  end

  def batting_average(batting)
    avg = batting.total_h/batting.total_ab.to_f
    avg = avg.nan? ? 0 : avg
    number_with_precision(avg, precision: 3)
  end
  
  def teams(batting)
    tids = batting.tids.split(',')
    names = []
    tids.each do |tid|
      names << Team.where(team_id: tid).first.name
    end
    names.to_sentence
  end
  
end
