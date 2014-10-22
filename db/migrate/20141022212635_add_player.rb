class AddPlayer < ActiveRecord::Migration
  def change
  	create_table :players do |t|
  		t.string :first_name
  		t.string :last_name
  		t.string :email
  		t.string :password
  		t.string :right_left_handed
  		t.timestamps
  	end
  end
end
