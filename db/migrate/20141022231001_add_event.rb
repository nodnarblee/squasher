class AddEvent < ActiveRecord::Migration
  def change
  	create_table :events do |t|
  		t.string :label
  		t.timestamps
  	end
  end
end
