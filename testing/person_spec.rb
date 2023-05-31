require_relative '../person'

describe Person do
  describe '#initialize' do
    it 'Creates a new person' do
      person = Person.new(17, 'John Doe')
      expect(person.name).to eq 'John Doe'
    end
  end
end
describe Person do
  describe '#initialize' do
    it 'Creates a new person' do
      person = Person.new(17, 'John Doe')
      expect(person.age).to eq 17
    end
  end
end
