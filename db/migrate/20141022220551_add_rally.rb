class AddRally < ActiveRecord::Migration
  def change
  	create_table :rallies do |t|
      t.references :game
      t.references :player
  		t.datetime :start_time
  		t.datetime :end_time
      t.integer :player_1_score
      t.integer :player_2_score
  		t.string :serve_player
  		t.string :serve_side
      t.timestamps
  	end
  end
end
