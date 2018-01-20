require 'csv'

@students = []  # Empty array accessible to all methods

# 1. print the menu and ask the user what to do - refactoring the code creating print_menu method
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end
# reafactoring the code - Create a interactive_menu method calling the print_menu method inside
# Use of a loop inside this method to keep asking for user input
def interactive_menu
  loop do
    print_menu # Invoking print_menu method
    process(STDIN.gets.chomp) # using input as argument of process method
  end
end
# 3. refactoring, create a method to do what the user ask
def process(selection)
  case selection
  when "1" then input_students #invoking input_students method
  when "2" then show_students #invoking show_students method
  when "3" then save_students
  when "4" then load_students
  when "9" then exit # this will end the program
  else  puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
# Get the first name with gets.chomp
  name = STDIN.gets.chomp
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
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  prints_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

def prints_student_list # print the list of students
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
# finally we print the total
  puts "Overall, we have #{@students.count} great students"
end

# save a the students list into a csv file
def save_students
# open the csv file for writing
  file = File.open("students.csv", "w")
# iterate over students to get each student information
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(", ")
    file.puts csv_line
    puts "#{student[:name]} has been saved"
  end
  file.close
end

def load_students(filename = "students.csv") #If argument is not supplied, csv file will be used
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
      @students << {name: name, cohort: cohort.to_sym}
      puts "Information has been loaded"
  end
file.close
end
#Loading student file using arguments from command line ARGV
def try_load_students
  filename = ARGV.first #first argument of command line
  return if filename.nil? # stop executing the code inside the method
  if File.exists?(filename)# if file exists then execute load_students method
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # If file doesn't exist
    puts "Sorry, #{filename} doesn't exist"
    exit # quit the program
  end
end

interactive_menu
try_load_students
