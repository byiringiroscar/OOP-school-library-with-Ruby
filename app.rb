require 'json'
# rubocop:disable Metrics/ClassLength
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
    File.open('teacher.json', 'a') do |file|
      file.write(JSON.generate({ name: teacher.name, age: teacher.age, specialization: teacher.specialization }))
      file.write("\n")
    end
  end

  # rubocop:disable Metrics/MethodLength
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
      File.open('student.json', 'a') do |file|
        file.write(JSON.generate({ id: student.id, name: student.name, age: student.age,
                                   parent_permission: student.parent_permission }))
        file.write("\n")
      end

    elsif choice_choosed == 2

      choice_teacher
    else
      puts 'Invalid option, try again'
    end
  end

  # rubocop:enable Metrics/MethodLength
  def create_book
    print 'Title: '
    title = gets
    print 'Author: '
    author = gets
    require_relative 'book'
    book = Book.new(title, author)
    @books << book
    puts "Book created of title #{book.title}"
    File.open('book.json', 'a') do |file|
      file.write(JSON.generate({ title: book.title, author: book.author }))
      file.write("\n")
    end
  end

  def list_books
    puts 'List of Books:'
    file = File.read('book.json')
    data = file.split("\n").map { |line| JSON.parse(line) }
    data.each do |book|
      puts "Title: #{book['title'].chomp}"
      puts "Author: #{book['author']}"
      puts '------------------------'
    end
  end

  def list_all_people
    puts 'List of Students:'
    file = File.read('student.json')
    data = file.split("\n").map { |line| JSON.parse(line) }
    data.each do |person|
      puts "Id: #{person['id']}"
      puts "Name: #{person['name'].chomp}"
      puts "Age: #{person['age']}"
      puts "Parent Permission: #{person['parent_permission']}"
      puts '------------------------'
    end

    puts 'List of Teachers:'
    file = File.read('teacher.json')
    data = file.split("\n").map { |line| JSON.parse(line) }
    data.each do |person|
      puts "Name: #{person['name'].chomp}"
      puts "Age: #{person['age']}"
      puts "Parent Permission: #{person['parent_permission']}"
      puts '------------------------'
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

  def save_rental(rental)
    File.open('rental.json', 'a') do |file|
      file.write(JSON.generate({ date: rental.date, book: rental.book.title, person: rental.person.name }))
      file.write("\n")
    end
  end

  def validate_empty_people
    return unless @allpeople.empty?

    puts 'No people available. Please create a person first.'
    nil
  end

  def validate_empty_book
    return unless @books.empty?

    puts 'No books available. Please create a book first.'
    nil
  end

  def create_rental
    validate_empty_people
    puts 'Select a person from the following list by number (not ID):'
    display_people_list
    selected_person_index = gets.to_i
    selected_person = @allpeople[selected_person_index]
    validate_empty_book
    puts 'Select a book from the following list by number (not ID):'
    display_book_list
    selected_book_index = gets.to_i
    selected_book = @books[selected_book_index]
    puts 'Date: '
    date = gets.chomp
    rental = Rental.new(date, selected_book, selected_person)
    @rentals << rental
    save_rental(rental)
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
# rubocop:enable Metrics/ClassLength
