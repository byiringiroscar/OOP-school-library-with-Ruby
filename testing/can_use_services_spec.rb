require_relative '../person'

describe 'Can use service' do
  it 'The can_use_services? method returns true if over age' do
    person = Person.new(18, 'Sam', false)
    expect(person.can_use_services?).to be true
  end

  it 'The can_use_services? method returns false if under age and no parent permission' do
    person = Person.new(17, 'Sam', false)
    expect(person.can_use_services?).to be false
  end
end
