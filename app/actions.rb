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

end

