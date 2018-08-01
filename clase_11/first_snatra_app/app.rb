require 'sinatra'
# require 'bundler/setup'
# Bundler.require(:defualt)

get '/' do
    @name='Andres Soto'
    erb :index
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