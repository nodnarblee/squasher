class AddPlayer < ActiveRecord::Migration
  def change
  	create_table :players do |t|
  		t.string :first_name
  		t.string :last_name
  		t.string :email
  		t.string :password
  		t.string :right_left_handed
      t.references :matches
      t.references :game
      t.references :rallies
  		# has_many :matches
  		# has_many :games, through: :matches
  		# has_many :rallies, through: :games
  		# has_many :events, through: :games
  		
  		t.timestamps
  	end
  end
end
