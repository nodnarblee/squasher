class Rally < ActiveRecord::Base
  
  belongs_to :game
  has_many :events

end