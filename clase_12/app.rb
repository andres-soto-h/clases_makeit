require 'bundler/setup'
Bundler.require(:default)


get '/' do
    #binding.pry
    if request.cookies["email"] && request.cookies["password"]
        @name="Andrés Soto"
        erb :index
    else
        #binding.pry
        redirect '/login'
    end
end

get '/login' do
    erb :login
end

post '/login' do
    response.set_cookie('email',params[:email])
    response.set_cookie('password',params[:password])
    redirect '/index'
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
    @saluda='Welcome to my first app'
    erb :home
end

get '/contact' do
    @correo='andres.soto.h@outlook.com'
    @telefono='3134123712'
    erb :contact
end


get '/products' do
    @products=['web design','backend development']
    erb :products
end

