require 'sinatra'
require 'pry'
require 'make_todo'

get '/' do
  @task_list=Tarea.all
  erb :index
end

post '/complete' do
  Tarea.update(params[:id])
  redirect '/'
end

post '/new' do
    title=params[:title]
    if title.length>0
        Tarea.create(title)
    end
    redirect '/'
  end

post '/delete' do
    Tarea.destroy(params[:id])
    redirect '/'
end
  