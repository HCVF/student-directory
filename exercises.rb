def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # ask for student height
    puts "Height of student in cm please"
    # get height
    height = gets.chomp.chomp("cm")
    # add the student hash to the array
    students << {name: name, cohort: :november, height: height}
    puts "Now we have #{students.count} students\n\n"
    # get another name from the user, ask for name again for clarity
    puts "Name of next student please"
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  n = 0
  while n < students.count
    puts "#{students[n][:name]}, #{students[n][:height]}cm, #{students[n][:cohort]} cohort"
    n += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)