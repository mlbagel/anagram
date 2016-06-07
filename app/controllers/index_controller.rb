get '/' do
  @page="home"
  erb :index
end

get '/anagrams/:word' do
  @page="answer"
  @word = params[:word]
  alphabetized_string = @word.chars.sort.join
  @anagrams = Word.where("letters=?", alphabetized_string)
  erb :show
end


post '/' do
    @word = params[:word]
    begin
      Word.valid_input(@word)
      redirect "/anagrams/#{@word}"
    rescue Exception => error
      @page="home"
      @error = error.message
      erb :index
    end
end

=begin
post '/' do

  @word = params[:word]
  if Word.valid_input?(@word)
    redirect "/anagrams/#{@word}"
  else
    @page="home"
    @error = "Sorry, this is not a valid 3 letter word"
    erb :index
  end
end
=end
=begin
get '/anagrams/:word' do
    @page="answer"
  @word = params[:word]
  @anagrams = Word.find_anagrams(@word)
  erb :show
end
=end
