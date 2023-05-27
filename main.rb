require_relative 'app'

new_app = App.new
welcome_count = 0
welcome_message = 'Welcome to School Library System!'

entry_point = <<~PARAGRAPH

  #{welcome_count.positive? ? '' : welcome_message}


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
  welcome_count += 1
  answer = gets.chomp
  answer = answer.to_i
  case answer
  when 1
    new_app.list_books
  when 2
    new_app.list_all_people
  when 3
    new_app.create_person
  when 4
    new_app.create_book
  when 5
    new_app.create_rental
  when 6
    new_app.rentals_by_person_id
  when 7
    exit = true
  else
    puts 'Invalid option, try again'
  end

end

puts exit_message
