class Player < ActiveRecord::Base

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true   #need confirmation?
  
  # has_many :matches
  # has_many :games, through: :matches
  has_many :rallies, through: :games
  has_many :events, through: :games

end