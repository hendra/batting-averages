class Team < ApplicationRecord
  has_many :battings, foreign_key: 'team_id', primary_key: 'team_id'
end
