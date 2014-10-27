require 'pry'
enable :sessions

helpers do 

  # def session_user
  #   return Player.find(session[:id]) if session[:id]
  # end

  def session_player_2
    return Player.find(session[:player2]) if session[:player2]
  end 

  def session_player_1
    return Player.find(session[:player1]) if session[:player1]
  end 



  # def add_point #rally 
  #   @match = Match.all
  #   @rally = Rally.new(
  #   player_id: @player.id
  #   )
  #   redirect '/'
  # end 

  ##match 
  ##match 

  def set_player_1
    current_player = @player1 
  end

  def set_player_2
    current_player = @player2
  end 

  def win? 
    #@player_a = Player.find(params[:id])
    #@player_a.points

    #player_b = Player.find(params[:id])
    #player_b.points

    @player1 = Player.find(params[:id])
    @player2 = Player.find(params[:id])
    @win = 11 

    #11 points to win a game as long as the winning point is at least 11 and greater than opponents points by 2 for that particular game

    # true if (@player1.points == @win && @player1.points > (@player2.points + 2))

    true if (session[:player1].game.rally.count == win && session[:player1].game.rally.count > (session[:player2].game.rally.count + 2))
  end    

end 

# Homepage (Root path)
get '/' do
   @players = Player.all
  erb :index
end

###SIGN UP
get '/signup' do 
  erb :'players/signup'
end 

post '/signup' do 
  @player = Player.new(
    email: params[:email],
    first_name: params[:firstname],
    last_name: params[:lastname],
    password: params[:password]
    )
    if @player.save
      redirect '/login'
    else  
      erb :'/login'
    end 
end 

##LET 
post '/let' do 
  @event = Event.new(
    label: params[:label]
    ) 
  @event.save 
end 


###LOGIN 
get '/login' do
  erb :'players/login'
end 

post '/login' do
  @player = Player.find_by email:(params[:email])
  sessions[:id] = @player.id
  redirect '/'
end

###RALLY (BRANDONS)
get '/rallies' do
  @rally = Rally.where(nil)
end 

#####PLAYER 1 RALLY 
post '/rallies/new_player_1_rally' do 
  @rally = Rally.new(
  player_id: session[:player1],
  game_id: session[:current_game], 
  player_1_score: 1,
  player_2_score: 0
  )
  @rally.save
  redirect "/rallies/#{@rally.id}"
end

##### PLAYER 2 RALLY 
post '/rallies/new_player_2_rally' do 
  @rally = Rally.new(
  game_id: session[:player2],
  player_1_score: + 0,
  # serve_player: session[:player2].first_name,
  player_2_score: + 1 
  )
  @rally.save
  # redirect "/rallies/#{@rally.id}"
  print session[:player2]
end 

get '/rallies/:id' do
  redirect '/'
end

###LOGOUT 
get '/logout' do 
  session.clear
  redirect '/login'
end 

###

## START MATCH

get '/match' do
  @players = Player.all
  erb :'matches/index'
end

get '/:id' do
  @players = Player.all
  @rally = Rally.all
  erb :'index'
end

post '/match/create' do
  input1 = params[:player_1]
  @player1 =  Player.find(input1)
  session[:player1] = @player1

  input2 = params[:player_2]
   @player2 =  Player.find(input2)
    session[:player2] = @player2

  @match = Match.new(player_id: session[:player1].id, player_id: session[:player2].id)
  # @match.save
    if @match.save
    session[:current_match] = @match
    # return session[:current_match].player_1_id.to_s
    redirect "/#{@match.id}"

  #{session[:current_match].player_2_id}  my id : #{session[:current_match].id} 
    end 
end
## hook up your submit button to the players you just selected
# post '/player1' do
#    input = params[:player]
#    @player1 =  Player.find(params[:input])
#    session[:player1] = @player1.id
#    redirect "/#{@player1.id}"  
# end

# post '/player2' do
#    input = params[:player]
#    @player2 =  Player.find(params[:input])
#    session[:player2] = @player2.id
# end

##set two different session keys
