enable :sessions

helpers do 

  def current_player
    return Player.find(session[:id]) if session[:id]
  end

end  

# Homepage (Root path)
get '/' do
  erb :index
end

###SIGN UP
get '/signup' do 
  erb :'players/signup'
end 

post '/signup' do 
  @player = Player.new(
    email: params[:email],
    first_name: params[:first_name],
    last_name: params[:last_name],
    password: params[:password])
  erb :'players/signup'
end 

# ###LOGIN 
# get '/login' do
#   erb :'players/login'
# end

# post '/login' do
#   @player = Player.find_by email:(params:[:email])
#   session[:id] = @player.id
# end  

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