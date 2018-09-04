require 'sinatra'
require 'pry'

get '/' do
    #binding.pry
    @nombre = params[:nombre]
    erb :index
end