def load_tasks(file_name)

    task_array=[]

    def to_b(str)
        str=="true" ? true : false
    end

    if File.file?(file_name)

        file_as_array=IO.readlines(file_name)
            
        file_as_array.each do |element|
            
            task_hash={}
            
            split=element.split(',')
            
            task_hash[:id]=split[0].to_i
            task_hash[:name]=split[1]
            task_hash[:done]=to_b(split[2].chop)

            task_array.push(task_hash)

        end
    end
    
    task_array

end

def save_tasks(file_name,array)

    File.open(file_name,'w'){|file| file.write("")}

    array.each do |value|
        
        File.open(file_name,'a'){|file| file.puts("#{value[:id]},#{value[:name]},#{value[:done]}")}
    
    end

end

puts load_tasks('tareas.txt')

save_tasks('tareas2.txt', [
    { id: 1, name: "Hacer tareas", done: true },
    { id: 2, name: "Lavar ropa", done: false }
  ])



  def load_tasks(file)
    return [] unless File.file?(file)
  
    tasks = []
    File.foreach(file) do |line|
      id, name, done = line.chomp.split(',')
      tasks.push({ id: id.to_i, name: name, done: done == "true" })
    end
    tasks # muy importante retornar las tareas
  end
  
  def save_tasks(file, tasks)
    File.open(file, 'w') do |f|
      tasks.each { |t| f.puts "#{t[:id]},#{t[:name]},#{t[:done]}" }
    end
  end
