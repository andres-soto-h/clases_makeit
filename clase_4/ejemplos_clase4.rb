

file_as_array=IO.readlines("students.txt")

file_as_array.map {|student| student.chop!}

p file_as_array