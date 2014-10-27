class Match < ActiveRecord::Base

  has_many :players
  has_many :games
  has_many :rallies, through: :games
  has_many :events, through: :games

  # validate :max_games

  after_save :create_game

  def create_game
    Game.new(
      match_id: id
      )
  end 

  private 

  def max_games? 
    self.games.count == 3 
  end 

end