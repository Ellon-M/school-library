require_relative 'person'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'classroom'
require_relative 'nameable'
require_relative 'preserve_data'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
    read_person
    read_books
    read_rentals
  end

  def list_books
    if @books.empty?
      puts "There are no books available yet\n\n"
    else
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
  end

  def list_people
    if @people.empty?
      puts "There are no people yet.\n\n"
    else
      @people.each do |person|
        puts "Name: #{person.name} Age: #{person.age} ID: #{person.id}"
      end
    end
  end

  def add_person
    puts 'Do you want to create a student (1) or a teacher(2)?'
    input_res = gets.chomp.to_i

    case input_res
    when 1
      add_student
    when 2
      add_teacher
    end
  end

  def add_student
    puts 'Classroom: '
    classroom = gets.chomp

    puts 'Age: '
    age = gets.chomp

    puts 'Name: '
    name = gets.chomp

    puts 'Has Parent permission? [Y/N] '
    parent_permission = gets.chomp

    student = Student.new(name, age, classroom, parent_permission)
    @people.push(student)
    save_person
    puts 'Student Created Successfully'
  end

  def add_teacher
    puts 'Specialization: '
    specialization = gets.chomp

    puts 'Age: '
    age = gets.chomp

    puts 'Name: '
    name = gets.chomp

    puts 'Has Parent permission? [Y/N] '
    parent_permission = gets.chomp

    teacher = Teacher.new(age, specialization, name, parent_permission)
    @people.push(teacher)
    save_person
    puts 'Teacher Created Successfully'
  end

  def add_book
    puts 'Title: '
    title = gets.chomp

    puts 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books.push(book)
    save_books
    puts 'Book Added Successfully'
  end

  def add_rental
    if @books.empty?
      puts 'No book record found'
    elsif @people.empty?
      puts 'No person record found'
    else
      puts 'Select a book from the following list by number: '
      @books.each_with_index do |book, index|
        puts "#{index.to_i + 1}) Book Title: #{book.title}, Author: #{book.author}"
      end
      rental_book = gets.chomp.to_i - 1
      puts 'Select a person from the following list by number: '
      @people.each_with_index do |person, index|
        puts "#{index.to_i + 1}) Name: #{person.name} Age: #{person.age} Id: #{person.id}"
      end
      rental_person = gets.chomp.to_i - 1
      puts 'Please enter the date: '
      date = gets.chomp
      rental_detail = Rental.new(date, @books[rental_book], @people[rental_person])
      @rentals.push(rental_detail)
      save_rentals
      puts 'Rental Added Successfully'
    end
  end

  def list_rentals
    if @rentals.empty?
      puts 'There are no rentals yet'
    else
      puts 'Please enter the person id: '
      p_id = gets.chomp.to_i
      @rentals.each do |rental|
        puts "Date: #{rental.date}, Book:#{rental.book.title} by #{rental.book.author}\n\n" if rental.person.id == p_id
      end
    end
  end
end
