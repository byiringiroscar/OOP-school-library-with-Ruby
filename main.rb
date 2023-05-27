require_relative 'app'

newApp = App.new
welcomeCount = 0
welcomeMessage = "Welcome to School Library System!"

entry_point = <<~PARAGRAPH
  #{welcomeCount > 0 ? '' : welcomeMessage}

  
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
exit_message = 'Thanks for visiting us!'
until exit
  puts entry_point
  welcomeCount += 1
  answer = gets.chomp
  answer = answer.to_i
  case answer
  when 1
    newApp.listBooks
  when 2
    newApp.listAllPeople
  when 3
    newApp.createPerson
  when 4
    newApp.createBook
  when 5
    newApp.createRental
  when 6
    newApp.getRentalsByPersonId
  when 7
    exit = true
  else
    puts 'Invalid option, try again'
  end

end

puts exit_message
