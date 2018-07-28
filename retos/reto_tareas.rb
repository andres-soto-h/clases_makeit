def load_tasks(file_name)

    def to_b(str)
        str=="true" ? true :false
    end

    file_as_array=IO.readlines(file_name)
    task_array=[]
    
    file_as_array.each do |element|
        
        task_hash={}
        
        split=element.split(',')
        
        task_hash[:id]=split[0].to_i
        task_hash[:name]=split[1]
        task_hash[:done]=to_b(split[2])

        task_array.push(task_hash)

    end
    task_array
end

def save_tasks()

end

p load_tasks('tareas.txt')