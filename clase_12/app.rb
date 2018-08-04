require 'bundler/setup'
Bundler.require(:default)
require "./models.rb"


set :database, "sqlite3:myblogdb.sqlite3"

get '/' do
    #binding.pry
    if request.cookies["email"] && request.cookies["password"]
        @posts = Post.all
        @name="Andrés Soto"
        erb :home
    else
        #binding.pry
        redirect '/login'
    end
end

post '/post' do
    @post = Post.create(title: params[:title], body: params[:body])
    redirect '/'
end
  
get '/login' do
    erb :login
end

post '/login' do
    response.set_cookie('email',params[:email])
    response.set_cookie('password',params[:password])
    redirect '/home'
end

post '/logout' do
    response.cookies.clear
    redirect 'login'
end

get '/registro' do    
    erb :form
end


post '/register-results' do
    @name=params[:name]
    @last_name=params[:last_name]
    @address=params[:address]
    @email=params[:email]
    @age=params[:age]
    @sex=params[:sex]
    erb :form_data
end

get '/home' do
    if request.cookies["email"] && request.cookies["password"]
        @saluda='Welcome to my first app'
        @name="Andrés Soto"
        erb :home
    else
        #binding.pry
        redirect '/login'
    end
end

get '/contact' do

    if request.cookies["email"] && request.cookies["password"]
        @correo='andres.soto.h@outlook.com'
        @telefono='3134123712'
        erb :contact
    else
        #binding.pry
        redirect '/login'
    end

end


get '/products' do
    if request.cookies["email"] && request.cookies["password"]
        @products=['web design','backend development']
        erb :products
    else
        #binding.pry
        redirect '/login'
    end
end

