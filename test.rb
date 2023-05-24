require_relative 'person'
require_relative 'base'
require_relative 'capitalize'
require_relative 'trim_name'
require_relative 'rental'
require_relative 'book'

person = Person.new(22, 'maximilianus')
book = Book.new('Bible', 'jesus')
rental1 = Rental.new('2023-05-24', book, person)
rental2 = Rental.new('2023-05-25', book, person)

person.add_rental(rental1)
person.add_rental(rental2)

puts person.rentals[0].date
puts person.rentals[1].date
