@students = []

def input_students
  puts "Please enter the names of the students, followed by their details"
  puts "To finish, just type stop anytime"
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
    @students << {name: name, fav_food: fav_food, cohort: cohort.to_sym}
  end
    puts "Now we have #{@students.count} students"
end

def print_header
puts "The students of Villains Academy"
puts "-------------"
end

def print_student_list
  sorted_by_cohort = {}
    if @students.length >= 1
      @students.each do |student|
        cohort = student[:cohort]
        name = student[:name]
        if sorted_by_cohort[cohort] == nil
          sorted_by_cohort[cohort] = [name]
        else
          sorted_by_cohort[cohort].push(name)
        end
      end
    end
  sorted_by_cohort.each do |cohort, names|
    puts "Cohort: #{cohort}"
    puts names
  end
end

def print_footer
  if @students.count == 1
  puts "Overall we have #{@students.count} great student"
  else
  puts "Overall we have #{@students.count} great students"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def process(selection)
  case selection
    when "1"
      students = input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

interactive_menu
