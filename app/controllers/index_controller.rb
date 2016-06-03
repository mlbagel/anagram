get '/' do
  @page="home"
  erb :index
end


get '/anagrams/:word' do
    @page="answer"
  @word = params[:word]
  @anagrams = Word.find_anagrams(@word)
  erb :show
end

post '/' do

  @word = params[:word]
  if @word.length == 3
    redirect "/anagrams/#{@word}"
  else
    "Sorry, this is not a 3 letter word"
  end
end
