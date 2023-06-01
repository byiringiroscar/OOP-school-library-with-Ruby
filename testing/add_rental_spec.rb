require_relative '../rental'
require_relative '../book'
require_relative '../person'

describe 'Rental' do
  let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }
  let(:person) { Person.new(25, 'John Doe') }
  let(:rental_date) { '2023-05-31' }
  let(:rental) { Rental.new(rental_date, book, person) }

  it 'has a rental date' do
    expect(rental.date).to eq(rental_date)
  end

  it 'is associated with a book' do
    expect(rental.book).to eq(book)
  end

  it 'is associated with a person' do
    expect(rental.person).to eq(person)
  end

  it 'adds the rental to the book' do
    expect(book.rentals).to include(rental)
  end

  it 'adds the rental to the person' do
    expect(person.rentals).to include(rental)
  end
end
