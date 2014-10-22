class AddRally < ActiveRecord::Migration
  def change
  	create_table :rallies do |t|
  		t.timestamps
  		t.datetime :start_time
  		t.datetime :end_time
  		t.string :player_id
  		t.string :serve_player
  		t.string :serve_side
  	end
  end
end
