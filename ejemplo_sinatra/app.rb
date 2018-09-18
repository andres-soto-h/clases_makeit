require 'sinatra'
require 'pry'

get '/' do
  @num = if request.cookies['number']
           request.cookies['number'].to_i
         else
           0
         end
  erb :index
end

post '/' do
  response.set_cookie('number', params[:number].to_i + 1)
  @num = request.cookies['number'].to_i
  redirect '/'
end
