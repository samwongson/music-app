# Homepage (Root path)
get '/' do
  erb :index
end

get '/songs' do
  @songs = Song.all
  erb :'songs/index'
end

get '/songs/new' do
  @song = Song.new
  erb :'songs/new'
end

post '/songs' do
  # binding.pry
  @song = Song.new(
    
    title:  params[:title],
    artist: params[:artist],
    url: params[:url]

  )
  # binding.pry
  
  if @song.save
    redirect '/songs'
  else
    erb :'songs/new'
  end
end
