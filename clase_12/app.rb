require 'bundler/setup'
Bundler.require(:default)
require './models.rb'

set :database, 'sqlite3:myblogdb.sqlite3'

helpers do
  def bar(name)
    "#{name}bar"
  end
end

get '/:vendor' do
  bar(params['vendor'])
end

get '/' do
  if request.cookies['email'] && request.cookies['password']
    @posts = Post.all
    @name = 'Andrés Soto'
    erb :home, layout: :home_layout
  else
    redirect '/login'
  end
end

post '/post' do
  @post = Post.create(title: params[:title], body: params[:body])
  redirect '/'
end

get '/post/:id' do
  @post = Post.find(params[:id])
  erb :post_page
end

put '/post/:id' do
  @post = Post.find(params[:id])
  @post.update(title: params[:title], body: params[:body])
  @post.save
  redirect '/post/' + params[:id]
end

delete '/post/:id' do
  @post = Post.find(params[:id])
  @post.destroy
  redirect '/'
end

get '/login' do
  erb :login, layout: :layout_login
end

post '/login' do
  response.set_cookie('email', params[:email])
  response.set_cookie('password', params[:password])
  redirect '/home'
end

post '/logout' do
  response.delete_cookie(:email, value = {})
  response.delete_cookie(:password, value = {})
  redirect 'login'
end

get '/registro' do
  erb :form
end

post '/register-results' do
  @name = params[:name]
  @last_name = params[:last_name]
  @address = params[:address]
  @email = params[:email]
  @age = params[:age]
  @sex = params[:sex]
  erb :form_data
end

get '/home' do
  if request.cookies['email'] && request.cookies['password']
    @posts = Post.all
    @saluda = 'Welcome to my first app'
    @name = 'Andrés Soto'
    erb :home, layout: :home_layout
  else
    # binding.pry
    redirect '/login'
  end
end

get '/contact' do
  if request.cookies['email'] && request.cookies['password']
    @correo = 'andres.soto.h@outlook.com'
    @telefono = '3134123712'
    erb :contact
  else
    redirect '/login'
  end
end

get '/products' do
  if request.cookies['email'] && request.cookies['password']
    @products = ['web design', 'backend development']
    erb :products
  else
    redirect '/login'
  end
end
