require_relative 'app'


entry_point = <<~PARAGRAPH

  Please choose an option by entering a number
  1 - List all books
  2 - List all people
  3 - Create a person
  4 - Create a book
  5 - Create a rental
  6 - List all rentals for a given person id
  7 - Exit
PARAGRAPH
exit = false
exit_message = "Thanks for visiting us!"
while !exit
  puts entry_point
  answer = gets.chomp()
  answer = answer.to_i
  if answer == 1
  puts 'Listing all books...'
  elsif answer == 2
  puts 'Listing all people...'
  elsif answer == 3
    createPerson
  elsif answer == 4
  puts 'Creating a book...'
  elsif answer == 5
  puts 'Creating a rental...'
  elsif answer == 6
  puts 'Listing all rentals for a given person id...'
  elsif answer == 7
    exit = true
  else
  puts 'Invalid option, try again'
  end
  
end

puts exit_message


