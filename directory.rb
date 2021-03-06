@students = []
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
#create an empty array
#get the first name
  name = gets.chomp
#while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    @students << {name: name, cohort: :november}
    if @students.count == 1
      puts "Now we have 1 student"
    else  
      puts "Now we have #{@students.count} students"
    end
    #get another name from the user
    name = gets.chomp
  end

end

def print_header
 puts "The students of Villains Academy"
 puts "--------------" 
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  if @students.count >= 1 
    print_header
    print_student_list
    print_footer
  else
    puts "There are no students enrolled at Villans Academy."  
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
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

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

interactive_menu




