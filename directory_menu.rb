
@students = []  # Empty array accessible to all methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
# Get the first name with gets.chomp
  name = gets.chomp
# Create a loop to keep running while name is not empty
  while !name.empty? do
#push each student hash into students array
    @students << {name: name, cohort: :november}
    if @students.count == 1
      puts "Now we are #{@students.count} student"
    else
      puts "Now we are #{@students.count} students"
    end
# get another name from the user
    name = gets.chomp
  end
end
# reafactoring the code - Create a interactive_menu method calling the print_menu method inside
# Use of a loop inside this method to keep asking for user input
def interactive_menu
  loop do
    print_menu
    process(gets.chomp) #storing user input into a variable
  end
end

# 1. print the menu and ask the user what to do - refactoring the code creating print_menu method
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  prints_student_list
  print_footer
end

# 3. refactoring, create a method to do what the user ask
def process(selection)
  case selection
    when "1"
      input_students #invoking input_students method
    when "2"
      show_students #invoking show_students method
    when "9"
      exit # this will end the program
    else
      puts "I don't know what you meant, try again"
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

def prints_student_list
  person = 0
  while person < @students.length do
      student_list = "#{person+1}. #{@students[person][:name]} (#{@students[person][:cohort]} cohort)"
      person += 1
    end
    puts student_list.center(350)
end

def print_footer
# finally we print the total
  puts "Overall, we have #{@students.count} great students"
end

interactive_menu
