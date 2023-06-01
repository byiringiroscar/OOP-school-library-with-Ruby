require_relative '../rental'
require_relative '../book'
require_relative '../person'

describe Rental do
  describe '#initialize' do
    it 'Creates a new rental' do
      person = Person.new(22, 'maximilianus')
      book = Book.new('Bible', 'jesus')
      rental = Rental.new('2023-05-24', book, person)
      expect(rental.date).to eq '2023-05-24'
    end
  end
end
