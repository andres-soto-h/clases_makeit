def load_tasks(file_name)

    task_array=[]

    def to_b(str)
        str=="true" ? true :false
    end

    if File.file?(file_name)

        file_as_array=IO.readlines(file_name)
            
        file_as_array.each do |element|
            
            task_hash={}
            
            split=element.split(',')
            
            task_hash[:id]=split[0].to_i
            task_hash[:name]=split[1]
            task_hash[:done]=to_b(split[2])

            task_array.push(task_hash)

        end
    end
    
    task_array

end

def save_tasks(file_name,array)

    array.each do |value|
        
        File.open(file_name,'a'){|file| file.puts("#{value[:id]}, #{value[:name]}, #{value[:done]}")}
    
    end

end

save_tasks('tareas2.txt', [
    { id: 1, name: "Hacer tareas", done: true },
    { id: 2, name: "Lavar ropa", done: false }
  ])
