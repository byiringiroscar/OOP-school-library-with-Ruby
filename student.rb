class Student < Person
  attr_reader :classroom, :id

  def initialize(name = 'Unknown', age = nil, parent_permission: true, classroom: nil)
    super(name, age, parent_permission)
    @classroom = classroom
    @id = Random.rand(1..1000)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
