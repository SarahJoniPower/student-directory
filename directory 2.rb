def input_students
  puts "Please enter the names of the students, followed by their details"
  puts "To finish, just type stop anytime"
  students = []
  while true do
    puts "Please enter a student name"
    name = gets.strip
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
  sorted_by_cohort = {}
  students.each do |student|
   cohort = student[:cohort]
   name = student[:name]
    if sorted_by_cohort[cohort] == nil
       sorted_by_cohort[cohort] = [name]
    else
       sorted_by_cohort[cohort].push(name)
    end
  end

  sorted_by_cohort.each do |cohort, names|
    puts "Cohort: #{cohort}"
    puts names
  end
end

def print_footer(students)
  if students.count == 1
  puts "Overall we have #{students.count} great student"
  else
  puts "Overall we have #{students.count} great students"
  end
end

students = input_students
print_header
print(students)
print_footer(students)
