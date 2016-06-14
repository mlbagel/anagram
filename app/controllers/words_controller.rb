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

    if @word.valid?
      @word.save
      redirect "/words/#{@word.id}"
    else
      @errors = 'This word is already in our Dictionary'
    end
  erb :"/words/new"
end

get '/words/:id/edit' do
  @page="answer"
  @word = Word.find(params[:id])
  erb :"/words/edit"
end

put '/words/:id' do
  @word = Word.find(params[:id])
  @word.text = params[:text]
  if @word.valid?
    @word.save
    redirect "/words/#{@word.id}"
  else
    @errors = 'You have an incomplete word'
  end

  erb :"/words/edit"
end

get '/words/:id' do
  @page="answer"
  @word = Word.find(params[:id])
  erb :"/words/show"
end

delete '/words/:id' do
  word = Word.find(params[:id])
  word.delete
  redirect "/words"
end
