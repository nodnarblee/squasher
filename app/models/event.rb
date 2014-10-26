class Event < ActiveRecord::Base

  belongs_to :rally
  belongs_to :player
  
end