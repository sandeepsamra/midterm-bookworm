# Homepage (Root path)
get '/' do
  erb :index
end

#<<<<<<< HEAD
get '/books' do
  @books = Book.all
  erb :'books/index'
end

#Add a book
get '/books/new' do
  @book = Book.new
  erb :'books/new'
end

post '/books' do
  @book = Book.new(
    author:   params[:author],
    title: params[:title],
    genre:  params[:genre]
  )
  if @book.save
    redirect '/books'
  else
    erb :'books/new'
  end 
end
#comment
#logout
get '/logout' do
  session.delete(:user_id)
  redirect '/'
end
#=======
get '/login' do
  erb :login
end

#>>>>>>> origin/rough-copy
