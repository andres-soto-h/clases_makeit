
persona_nueva={}
persona2={}

persona2={"nombre"=>"Andrés","edad"=>26}

p persona2["nombre"]

persona2["peso"]=70

p persona2


persona2.each do |llave, valor|
    puts "#{llave}: #{valor}"
end


persona_nueva={:nombre =>"Andrés",:apellido=>"Soto",:edad=>26}

#p persona_nueva

persona_nueva={nombre: "Andrés",apellido:"Soto",edad:26}

#p persona_nueva


p persona2.length
p persona2.has_key?("edad")
p persona2.keys


