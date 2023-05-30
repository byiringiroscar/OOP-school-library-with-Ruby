class App
  attr_accessor :welcome_count
  def initialize()
    @welcome_count = 0
    @students = []
    @teachers = []
    @classrooms = []
    @books = []
    @rentals = []
    @allpeople = []
  end


  def choice_teacher
    print 'Age: '
    age = gets.to_i
    print 'Name: '
    name = gets
    print 'Specialization : '
    specialization = gets.chomp
    require_relative 'teacher'
    teacher = Teacher.new(age, name, specialization: specialization)
    @teachers << teacher
    @allpeople << teacher
    puts "Teacher created of name #{teacher.name}"
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    choice_choosed = gets.to_i
    if choice_choosed == 1
      print 'Age: '
      age = gets.to_i
      print 'Name: '
      name = gets
      print 'Has parent permission? [Y/N]: '
      parent_permission = gets.chomp.upcase
      parent_permission = parent_permission == 'Y'
      require_relative 'student'
      student = Student.new(age, name, parent_permission: parent_permission)
      @students << student
      @allpeople << student
      puts "Student created of name  #{student.name}"
    elsif choice_choosed == 2

      choice_teacher
    else
      puts 'Invalid option, try again'
    end
  end

  def create_book
    print 'Title: '
    title = gets
    print 'Author: '
    author = gets
    require_relative 'book'
    book = Book.new(title, author)
    @books << book
    puts "Book created of title #{book.title}"
  end

  def list_books
    puts 'List of Books:'
    @books.each do |book|
      puts "Title: \"#{book.title.chomp}\", Author: \"#{book.author.chomp}\""
    end
  end

  def list_all_people
    puts 'List of People:'
    @allpeople.each do |person|
      person_type = person.is_a?(Student) ? '[Student]' : '[Teacher]'
      puts "#{person_type} Name: #{person.name.chomp}, ID: #{person.id} Age: #{person.age}"
    end
  end

  def display_people_list
    @allpeople.each_with_index do |person, index|
      person_type = person.is_a?(Student) ? '[Student]' : '[Teacher]'
      puts "#{index}) #{person_type} Name: #{person.name.chomp}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def display_book_list
    @books.each_with_index do |book, index|
      puts "#{index}) Title: '#{book.title.chomp}', Author: #{book.author}"
    end
  end

  def create_rental
    if @allpeople.empty?
      puts 'No people available. Please create a person first.'
      return
    end
    puts 'Select a person from the following list by number (not ID):'

    display_people_list

    selected_person_index = gets.to_i
    selected_person = @allpeople[selected_person_index]
    if @books.empty?
      puts 'No books available. Please create a book first.'
      return
    end
    puts 'Select a book from the following list by number (not ID):'

    display_book_list

    selected_book_index = gets.to_i
    selected_book = @books[selected_book_index]

    puts 'Date: '
    date = gets.chomp
    rental = Rental.new(date, selected_book, selected_person)
    @rentals << rental
  end

  def rentals_by_person_id
    print 'Enter the ID of the person: '
    person_id = gets.chomp.to_i

    person_rentals = @rentals.select { |rental| rental.person && rental.person.id == person_id }

    if person_rentals.empty?
      puts 'No rentals found for the specified person ID.'
    else
      puts "Rentals for Person ID #{person_id}:"
      person_rentals.each do |rental|
        puts "Date: #{rental.date}, #{rental.person.name.chomp}, Book: '#{rental.book.title}' by #{rental.book.author}'"
      end
    end
  end
end
