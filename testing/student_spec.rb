require_relative '../student'

describe Student do
  describe '#initialize' do
    it 'Creates a new student' do
      student = Student.new(17, 'John Doe')
      expect(student.name).to eq 'John Doe'
    end
  end
end
describe Student do
  describe '#initialize' do
    it 'Creates a new student' do
      student = Student.new(17, 'John Doe')
      expect(student.age).to eq 17
    end
  end
end
