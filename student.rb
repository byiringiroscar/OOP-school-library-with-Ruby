require_relative 'person'
require_relative 'classroom'

class Student < Person
  attr_reader :classroom, :id

  def initialize(age = nil, name = 'Unknown', parent_permission: true, classroom: nil)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
    @id = Random.rand(1..1000)
    classroom&.add_student(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
