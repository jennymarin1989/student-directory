def input_students
puts "Please enter the names of the students"
puts "To finish, just hit return twice"
# Create an empty array to push the name of input_students
students = []
# Get the first name with gets.chomp
name = gets.chomp
# Create a loop to keep running while name is not empty
while !name.empty? do
#push each student hash into students array
  students << {name: name, cohort: :november}
  puts "Now we are #{students.count} students"
# get another name from the user
  name = gets.chomp
end
  return students
end

# this method will print the header
def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

=begin
# this method will print the list of students
def print(students)
  students.each_with_index do |student,index|
    puts "#{index+1}#{student[0]}"
end
  students.each do |student|
    name = student[:name]
     if name.length < 12 && name[0] == "T"
       puts name
    end
  end
end
=end
# this method will print the footer

def print(students)
  person = 0
  while person < students.length do
    puts "#{person+1}. #{students[person][:name]} (#{students[person][:cohort]} cohort)"
    person += 1
  end
end
def print_footer(names)
# finally we print the total
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
