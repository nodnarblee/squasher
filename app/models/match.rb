class Match < ActiveRecord::Base

  has_many :players
  has_many :games
  has_many :rallies, through: :games
  has_many :events, through: :games

end