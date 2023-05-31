require_relative '../classroom'

describe Classroom do
  describe '#initialize' do
    it 'Creates a new classroom' do
      classroom = Classroom.new('Math', [])
      expect(classroom.label).to eq 'Math'
    end
  end
end
