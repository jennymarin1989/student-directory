
# first, print the list of students
students = [
  "Dr. Hannibal Lecter",
  "Dr. Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates",
]
# and now print them using methods:

# this method will print the header
def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end
# this method will print the list of students
def print(names)
  names.each do |name|
    puts name
  end
end
# this method will print the footer
def print_footer(names)
# finally we print the total
  puts "Overall, we have #{names.count} great students"
end

print_header
print(students)
print_footer(students)
