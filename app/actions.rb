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

###LOGIN 
get '/login' do
  erb :'players/login'
end

post '/login' do
  @player = Player.find_by email:(params:[:email])
  session[:id] = @player.id
end  

###LOGOUT 
get '/logout' do 
  session.clear
  redirect '/login'
end 

###