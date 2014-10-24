class AddGame < ActiveRecord::Migration
  def change
  	create_table :games do |t|
  		t.string :match_id
  		t.timestamps
  	end
  end
end
