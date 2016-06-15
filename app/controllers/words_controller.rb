get '/words' do
  @page="home"
  @words = Word.all.order(text: :asc)

  erb :"/words/index"
end

get '/words/new' do
  @page="newword"
  @word = Word.new

    erb :"/words/new"
end

post '/words' do
    @word = Word.create(text: params[:text])

    #if Word.find_by_text(@word).present?
      #@errors = "This word is already in our Dictionary"
    #else
      @word.save
      redirect "/words/#{@word.id}"
  #  end
#  erb :"/words/new"
end

get '/words/:id/edit' do
  @page="answer"
  @word = Word.find(params[:id])
  erb :"/words/edit"
end

put '/words/:id' do
  @word = Word.find(params[:id])
  @word.text = params[:text]

 if Word.find_by_text(@word).present?
    @errors = "This word is already in our Dictionary"
  else
   @word.save
   redirect "/words/#{@word.id}"
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
