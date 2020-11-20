def input_students
  puts "Please enter the names of the students, followed by their details"
  puts "To finish, just type stop anytime"
  students = []
  while true do
    puts "Please enter a student name"
    name = gets.chomp
      if name.empty? == true
      name = 'MISSING'
      elsif name == 'stop'
        break
      end
    puts "Please enter their favourite food"
    fav_food = gets.chomp
      if fav_food.empty? == true
        fav_food = 'MISSING'
      elsif fav_food == 'stop'
        break
      end
    puts "Please enter their cohort"
    cohort = gets.chomp
      if cohort.empty? == true
        cohort = 'MISSING'
      elsif cohort == 'stop'
        break
      end
    students << {name: name, fav_food: fav_food, cohort: cohort.to_sym}
  end
    puts "Now we have #{students.count} students"
    students
end

def print_header
puts "The students of Villains Academy"
puts "-------------"
end

def print(students)
  counter = 0
  while counter < students.length
    puts "#{counter + 1}.#{students[counter][:name]}".center(10)
    puts "Favourite food:#{students[counter][:fav_food]}".center(15)
    puts "(#{students[counter][:cohort]} cohort)".center(15)
    counter += 1
  end
end

def print_footer(students)
puts "Overall we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
