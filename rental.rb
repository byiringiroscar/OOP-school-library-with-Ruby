require_relative 'book'

class Rental
    attr_accessor :date, :book, :person
    def initialize(date, book, person)
        @date = date
        @book = []
        book.add_rental(self)
        person.add_rental(self)
    end
end