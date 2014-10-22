class AddEvent < ActiveRecord::Migration
  def change
  	create_table :events do |t|
  		t.string :label
  		t.string :player_id
  		t.timestamps
  	end
  end
end
