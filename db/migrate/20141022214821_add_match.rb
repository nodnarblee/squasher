class AddMatch < ActiveRecord::Migration
  def change
  	create_table :matches do |t|
  		t.integer :player_1_id
  		t.integer :player_2_id
      t.references :player
      t.references :game
  		t.timestamps
  	end
  end
end
