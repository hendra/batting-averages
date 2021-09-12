class Batting < ApplicationRecord
  belongs_to :team, foreign_key: 'team_id', primary_key: 'team_id', optional: true
end
