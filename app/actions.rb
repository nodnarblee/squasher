enable :sessions

helpers do 

  def session_user
    return Player.find(session[:id]) if session[:id]
  end

  def add_point #rally 
    @match = Match.all
    @rally = Rally.new(
    player_id: @player.id
    )
    redirect '/'
  end 

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

    true if (@player1.points == @win && @player1.points > (@player2.points + 2))
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

###ADD POINT
get '/rallies' do
  @rally = Rally.where(nil)
end 

post '/rallies/new' do 
  @match = Match.all
  @rally = Rally.new(
  player_id: @player.id
  )
  @rally.save
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

get '/match/:id' do
  @players = Player.all
  @rally = Rally.all
  erb :'matches/show'
end

post '/match/create' do
  @match=Match.new(player_1_id: params[:player1], player_2_id: params[:player2])
  if @match.save
    redirect "/match/#{@match.id}"
  end
end
## hook up your submit button to the players you just selected
post '/player1' do
   input = params[:player]
   @player1 =  Player.find(params[:input])
end

post '/player2' do
   input = params[:player]
   @player2 =  Player.find(params[:input])
   
end
