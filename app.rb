def createPerson
    print "Do you want to create a student (1) or a teacher (2)? [Input the number]: "
    choice_choosed = gets.to_i
    if choice_choosed == 1
        print "Age: "
        age = gets.to_i
        print "Name: "
        name = gets
        print "Has parent permission? [Y/N]: "
        parent_permission = gets.chomp.upcase
        if parent_permission == "Y"
            parent_permission = true
        else
            parent_permission = false
        end
        require_relative 'student'
        student = Student.new(age, name, parent_permission: parent_permission)
        puts "Student created of name  #{student.name}"
    end
end
