helpers do
  def check_user
    session.delete(:login_error)
    @user = User.find_by(id: session[:user_id])
    unless @user
      session[:login_error] = "Please log in to your account."
      redirect '/'
    end
  end

  def current_user
    User.find_by(id: session[:user_id])
  end
end

get '/' do
  erb :index
end

get '/newuser' do
  erb :newuser
end

post '/newuser' do
  @user = User.create(params)
  redirect '/'
end

post '/validate' do
  email = params[:email]
  password = params[:password]
  user = User.find_by(email: email, password: password)
  if user
    session[:user_id] = user.id
    redirect '/books'
  else
    session.delete(:user_id)
    redirect '/'
  end
end

get '/books' do
  check_user
  @books = Book.all
  erb :'books/index'
end

#Add a book
get '/books/new' do
  check_user
  erb :'books/new'
end

get '/books/to_read' do
  check_user
  @books = Book.all
  erb :'books/to_read'
end

get '/books/done_reading' do
  check_user
  @books = Book.all
  erb :'books/done_reading'
end

post '/books' do
  @book = Book.new(
    author: params[:author],
    title: params[:title],
    genre:  params[:genre],
    user_id: current_user.id
  )
  #File.open('uploads/'+params[:book_image][:filename], "wb") do |new_file| 
    #new_file.write(params[:book_image][:tempfile].read)
  end
  if @book.save
    redirect '/books/to_read'
  else
    erb :'books/new'
  end 
end

post "/books/remove" do
  book = Book.find(params[:book_id])
  book.destroy
  redirect '/books/to_read'
end

post "/books/done" do
  book = Book.find(params[:book_id])
  book.done_reading = true
  book.save
  redirect '/books/to_read'
end

post '/books/comment' do
  book = Book.find(params[:book_id])
  book.comment = params[:comment]
  book.save
  redirect 'books/done_reading'
end

get '/books/done_reading' do
  check_user
  erb :'books/done_reading'
end

get '/logout' do
  check_user
  session.delete(:user_id)
  redirect '/'
end
