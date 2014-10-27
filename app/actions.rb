require 'pry'
enable :sessions

helpers do 

  def session_player_2
    return Player.find(session[:player2]) if session[:player2]
  end 

  def session_player_1
    return Player.find(session[:player1]) if session[:player1]
  end 

  def set_player_1
    current_player = @player1 
  end

  def set_player_2
    current_player = @player2
  end 

  def win?
    @current_match = Match.find(1)
    @players_rally = Rally.all
    @player_1_rallies = @players_rally.where(serve_player: "player_1")
    @player_2_rallies = @players_rally.where(serve_player: "player_2")
    win = 11 
    if @player_1_rallies.count >= win && @player_1_rallies.count >= (@player_2_rallies.count + 2)
      return true
    elsif @player_2_rallies.count >= win && @player_2_rallies.count >= (@player_1_rallies.count + 2)
      return true
    else
      return false
    end

  end    

end 

# Homepage (Root path)
get '/' do
   @players = Player.all
   @rally = Rally.all
   @match = Match.all
   @game = Game.all
   @current_match = @match.find(1)
    @player_1_rally = @rally.where(serve_player: "player_1")
    @player_2_rally = @rally.where(serve_player: "player_2")
   if @current_match.player_1_id != nil
     
     @first_player = Player.find(@current_match.player_1_id)
     @second_player = Player.find(@current_match.player_2_id)
    end

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
get '/home' do
  erb :'players/index'
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
  @current_match = Match.find(1)
  @rally = Rally.new(
  player_id: @current_match.player_1_id,
  game_id: session[:current_game], 
  serve_player: "player_1",
  player_1_score: 1,
  player_2_score: 0
  )
  # raly.serve_player
  @rally.save
  redirect "/"
end

##### PLAYER 2 RALLY 
post '/rallies/new_player_2_rally' do 
  @current_match = Match.find(1)
  @rally = Rally.new(
  player_id: @current_match.player_2_id,
  game_id: session[:current_game], 
  serve_player: "player_2",
  player_1_score: 0,
  player_2_score: 1
  )
  @rally.save
  redirect "/"
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
  
end

post '/match/serve' do #server
  @players = Player.all
  @selected_player1 = session[:player1]
  @selected_player2 = session[:player2]
  redirect '/'

end 
get '/match/serve' do
  erb :'/'

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

    @match = Match.find(1)
    @match.player_1_id = session[:player1].id
    @match.player_2_id = session[:player2].id
 
    @match.save

    if @match.save
      # session[:current_match] = @match
      # # return session[:current_match].player_1_id.to_s
      # @selected_player1 = session[:player1]
      # @selected_player2 = session[:player2]
       redirect "/"
    end
    
end

