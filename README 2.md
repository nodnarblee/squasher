Sinatra
=============

Brought to you by Lighthouse Labs

## Getting Started

1. `bundle install`
2. `shotgun -p 3000 -o 0.0.0.0`
3. Visit `http://localhost:3000/` in your browser

---- select_player ------
##Action
post '/player1' do
   input = params[:player]
   @player1 =  Player.find(params[:input])
  # do whatever you want now
end
post '/player2' do
   input = params[:player]
   @player2 =  Player.find(params[:input])
  # do whatever you want now
end
But you would need to give your select tag a name and your form an action:


##html 

---- select_turn ------
##Action
post '/turn' do
   input = params[:player]
   if input ==1 
   	@current_player =  @Player1
   else
   	@current_player =  @Player2
  # do whatever you want now
end
But you would need to give your select tag a name and your form an action:


##html 
<form method="post" action="/turn">
    <select name="player">
    	<option value = "1">1</option>
		<option value = "2">2</option>
	</select>
</form>

--- win game method -----
def win_game
	if player_1_points >= 11 && (player_1_points - player_2_ponts) >= 2
		puts "you win"-- this will be game complete method where it stores the score to games
	else
		add_point -- this is the add_point method that adds 1 point for each rally won
	end
end

---- serve_side method ----
This is pretty much the exact same problem as selecting player

<%= options_for_select([[left],[right]]) %>
output:
<option value = "1">left</option>
<option value = "2">right</option>
=========================


##Action
post '/side' do
  @playing_side = params[:sides]
  # do whatever you want now
end
But you would need to give your select tag a name and your form an action:


##html 
<form method="post" action="/side">
    <select name="sides">
    	<option value = "1">left</option>
		<option value = "2">right</option>
	</select>
</form>
    <!-- etc etc -->



