require 'bundler/setup'
Bundler.require(:default)

# get '/' do
#     @name='Andres Soto'
#     erb :index
# end

# get '/home' do
#     @saluda='Welcome to my first app'
#     erb :home
# end


# get '/contact' do
#     @correo='andres.soto.h@outlook.com'
#     @telefono='3134123712'
#     erb :contact
# end

get '/area/:figura' do
    case params[:figura]
        when "triangle"
            "El área de este #{params[:figura]} es: #{(params[:a].to_i*params[:b].to_i)/2}"
        when "square"
            "El área de este #{params[:figura]} es: #{params[:a].to_i**2}"
        when "rectangle"
            "El área de este #{params[:figura]} es: #{params[:a].to_i*params[:b].to_i}"
    end 
end




# get '/products' do
#     @products=['web design','backend development']
#     erb :products
# end


# get '/saludo' do
#     "Hola #{params[:name]} #{params[:tipo]}"
# end


# get '/make-a-get' do
#     [200, {"Content-Type" => "Text/html"}, "Esto es un get"]
# end

# post '/make-a-post' do
#     [200, {"Content-Type" => "Text/html"}, "Esto es un post"]
# end

# put '/make-a-put' do
#     [200, {"Content-Type" => "Text/html"}, "Esto es un put"]
# end

# delete '/make-a-delete' do
#     [200, {"Content-Type" => "Text/html"}, "Esto es un delete"]
# end


get '/form' do
    erb:form
end

post '/hello-from-form' do
    binding.pry
    name=params[:name]
    "Hola #{name} te saludo desde el formulario."
end
