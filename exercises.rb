def input_students
  puts "Please enter the names of the students".center(50)
  puts "To finish, just hit return twice".center(50)
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # ask for student height
    puts "Height of student in cm please".center(50)
    # get height
    height = gets.chomp.chomp("cm")
    # get cohort, if spelling mistake is made but not in the first 3 letters, the month will always register the correct symbol
    puts "Enter sudent's cohort".center(50) 
    cohort = gets.chomp.capitalize
    if cohort.empty? || cohort.include?("Ja")
      cohort = :January
    elsif cohort.include?("F")
      cohort = :February
    elsif cohort.include?("Mar")
      cohort = :March
    elsif cohort.include?("Ap")
      cohort = :April
    elsif cohort.include?("May")
      cohort = :May
    elsif cohort.include?("Jun")
      cohort = :June
    elsif cohort.include?("Jul")
      cohort = :July
    elsif cohort.include?("Au")
      cohort = :August
    elsif cohort.include?("S")
      cohort = :September
    elsif cohort.include?("O")
      cohort = :October
    elsif cohort.include?("N")
      cohort = :November
    elsif cohort.include?("D")
      cohort = :December
    else
      puts "Please carefully enter a month (e.g. 'February')".center(50)
      cohort = gets.chomp.capitalize.to_sym
    end 
    # add the student hash to the array
    students << {name: name, cohort: cohort, height: height}
    if students.count == 1
      puts"Now we have 1 student\n\n".center(50)
    else  
      puts "Now we have #{students.count} students\n\n".center(50)
    end  
    # get another name from the user, ask for name again for clarity
    puts "Name of next student please".center(50)
    name = gets.delete!("\n")
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print(students)
  n = 0
  while n < students.count
    puts "#{students[n][:name]}, #{students[n][:height]}cm, #{students[n][:cohort]} cohort".center(50)
    n += 1
  end
end

def print_footer(students)
  if students.count == 1
    puts "Overall we have 1 great student".center(50)
  else  
    puts "Overall, we have #{students.count} great students".center(50)
  end  
end

students = input_students
print_header
print(students)
print_footer(students)