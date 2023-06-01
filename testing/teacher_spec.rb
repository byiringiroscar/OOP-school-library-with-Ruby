require_relative '../teacher'

describe Teacher do
  describe '#initialize' do
    it 'Creates a new teacher' do
      teacher = Teacher.new(17, 'John Doe')
      expect(teacher.name).to eq 'John Doe'
    end
  end
end
describe Teacher do
  describe '#initialize' do
    it 'Creates a new teacher' do
      teacher = Teacher.new(17, 'John Doe')
      expect(teacher.age).to eq 17
    end
  end
end
