helpers do
  def check_user
    session.delete(:login_error)
    @user = User.find_by(id: session[:user_id])
    unless @user
      session[:login_error] = "Please log in to your account."
      redirect '/'
    end
  end
end

#this is a test

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

get '/logout' do
  session.delete(:user_id)
  redirect '/'
end
