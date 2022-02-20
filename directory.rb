@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    add_students(name)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list"
  puts "4. Load the list"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    request_filename("save")
  when "4"
    request_filename("load")
  when "9"
    exit #this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"  
  end
end

def print_header
  puts "\nThe students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students\n\n"
end

def save_students(filename = "students.csv")
  #open the file for writing
  file = File.open(filename.include?(".") ? filename : filename + ".csv", "w")
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "Students saved"
end

def add_students(name, cohort = :november)
  @students << {name: name, cohort: cohort.to_sym}
end

def request_filename(save_load)
  puts "Which file would you like to #{save_load}? Return to #{save_load} default file"
  file = gets.chomp
  if file.empty?
    file = "students.csv"
  end
  save_load == "load" ? load_students(file) : save_students(file)
end

def load_students(filename = "students.csv")
  File.open(filename.include?(".") ? filename : filename + ".csv", "r") do |file|
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_students(name, cohort)
  end
end
  puts "Loaded #{@students.count} from #{filename}"
end

def try_load_students
  filename = ARGV.first || "students.csv"
  if File.exist?(filename) # if it exists
    load_students(filename)
  else #if it doesnt exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quits the program
  end
end

try_load_students
interactive_menu