require 'bundler/setup'
Bundler.require(:default)
require './models.rb'

set :database, 'sqlite3:myblogdb.sqlite3'

get '/' do
  erb :home, layout: :home_layout
end

post '/post' do
  @post = Post.create(title: params[:title], body: params[:body])
  redirect '/blog'
end

get '/post/:id' do
  begin
    @post = Post.find(params[:id])
    erb :post_page
  rescue StandardError => e
    erb :error_page
  end
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
  redirect '/blog'
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
    erb :home, layout: :home_layout
  else
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

get '/blog' do
  if request.cookies['email'] && request.cookies['password']
    @posts = Post.all
    @name = 'Andrés Soto'
    erb :blog, layout: :blog_layout
  else
    redirect '/login'
  end
end
