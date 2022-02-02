require './student'
require './teacher'
require './book'
require './rental'
require './classroom'
require './writedata'

class Methods
  include Writedata

  attr_reader :books, :people, :rentals

  def initialize()
    @books = load_books
    @people = load_people
    @rentals = load_rentals
    @class = Classroom.new('class')
  end

  def list(input)
    case input
    when 1
      list_books
    when 2
      list_people
    when 3
      puts 'Do you want to add a student(1) or a teacher(2)? [input the number]:'
      p_input = gets.chomp.to_i
      person_input(p_input)
    when 4
      create_book
    when 5
      create_rentals
    when 6
      list_rentals
    else
      puts 'Please choose a valid number'
    end
  end

  def person_input(person_input)
    case person_input
    when 1
      add_student
    when 2
      add_teacher
    else
      puts 'Invalid number'
    end
  end

  def add_student
    puts 'Enter the name of student:'
    name = gets.chomp.to_s
    puts 'Enter the age of the student'
    age = gets.chomp.to_i
    puts 'parent permission? [Y/N]:'
    parent_permission = gets.chomp.downcase === 'y'
    student = Student.new(age: age, name: name, parent_permission: parent_permission, classroom: 'Grade 10')
    @people << student
    puts 'Student created successfully'
  end

  def add_teacher
    puts 'Enter the name of the teacher:'
    name = gets.chomp.to_s
    puts 'Enter the age of the teacher'
    age = gets.chomp.to_i
    puts 'Enter the Specialization:'
    specialization = gets.chomp
    teacher = Teacher.new(age: age, name: name, specialization: specialization)
    @people << teacher
    puts 'Teacher created successfully'
  end

  def create_book
    puts 'Enter the title of the book'
    title = gets.chomp
    puts 'Enter the author of the book'
    author = gets.chomp
    book = Book.new(title, author)
    @books << book unless @books.include?(book)
    puts 'Book created successfully'
  end

  def create_rentals
    puts 'Select a person from the folowing list by number (not id)'
    @people.each_with_index { |p, index| puts "#{index}) [#{p.class}] Name: #{p.name}, Age: #{p.age}, ID: #{p.id}" }
    person_index = gets.chomp.to_i
    puts 'Select a book from the folowing list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    book_index = gets.chomp.to_i
    puts 'Enter Date: '
    date = gets.chomp
    rental = Rental.new(date, @books[book_index], @people[person_index])
    @rentals << rental
    puts 'Rental created successfully'
  end

  def list_books
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author} " }
  end

  def list_people
    @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def list_rentals
    puts 'Please Enter the Person ID'
    id = gets.chomp
    puts 'Rentals : '
    rentals_list = @rentals.select { |r| r.person.id == id.to_i }
    rentals_list.each { |item| puts "Date: #{item.date}, Book: #{item.book.title} by #{item.book.author}" }
  end
end
