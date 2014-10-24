class Game < ActiveRecord::Base

  belongs_to :match
  has_many :rallies
  has_many :events

end