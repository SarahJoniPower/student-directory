def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
  students << {name: name, cohort: :november}
  puts "Now we have #{student.count} students"
  name = gets.chomp
  end
  students
end

def print_header
  put "The students of my cohort at Makers Academy'
  puts ``-------------``
end

def print(students)
  student.each do |student|
    puts '#{student[:name]} (#{student[:cohort]} cohort)'
  end
end

def print_footer(students)
  puts 'Overall we have #{students.count} great students'
end


students = input_students
print_header
print(students)
print_footer(students)
