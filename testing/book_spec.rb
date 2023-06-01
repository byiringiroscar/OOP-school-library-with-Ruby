require_relative '../book'

describe Book do
  describe '#initialize' do
    it 'Creates a new book' do
      book = Book.new('The Lord of the Rings', 'J. R. R. Tolkien')
      expect(book.title).to eq 'The Lord of the Rings'
    end
  end
end

describe '#add_rental' do
  it 'Adds a rental to the book' do
    book = Book.new('The Lord of the Rings', 'J. R. R. Tolkien')
    person = Person.new(17, 'John Doe')
    rental = Rental.new('2019-05-20', book, person)
    puts book.rentals
    expect(book.rentals).to include(rental)
  end
end
