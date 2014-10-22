class AddMatch < ActiveRecord::Migration
  def change
  	create_table :matches do |t|
  		t.string :player_1_id
  		t.string :player_2_id
  		t.timestamps
  	end
  end
end
