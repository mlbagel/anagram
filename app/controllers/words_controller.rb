get '/words' do
  @page="home"
  @words = Word.all
  erb :"/words/index"
end

get '/words/new' do
  @word = Word.new
  @page="home"
    erb :"/words/new"
end

post '/words' do
    @word = Word.create(text: params[:text])
    redirect "/words/#{@word.id}"
end

get '/words/:id' do
  @page="answer"
  @word = Word.find(params[:id])
  erb :"/words/show"
end
