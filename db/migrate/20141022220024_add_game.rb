class AddGame < ActiveRecord::Migration
  def change
  	create_table :games do |t|
  		t.references :match
      t.references :player
  		t.timestamps
  	end
  end
end
