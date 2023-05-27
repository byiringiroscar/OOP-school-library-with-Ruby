require_relative 'person'

class Teacher < Person
  attr_reader :specialization

  def initialize(name = 'Unknown', age = nil, parent_permission: true, specialization: 'General')
    super(name, age, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

# teacher = Teacher.new('John Doe', 35, specialization: 'Math')
# puts teacher.specialization # Output: John Doe
