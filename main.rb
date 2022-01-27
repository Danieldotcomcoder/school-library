require './person'
require './student'
require './teacher'
require './classroom'
require './book'
require './rental'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
    @class = Classroom.new('class')
    @list = {
      '1' => 'List all books',
      '2' => 'List all people',
      '3' => 'Create a person',
      '4' => 'Create a book',
      '5' => 'Create a rental',
      '6' => 'List all rentals for a given person id',
      '7' => 'Exit'
    }
  end

  def run
    puts 'Please choose an option by entering a number:'
    loop do
      @list.each do |key, value|
        puts "#{key} - #{value}"
      end
      input = gets.chomp.to_i
      if input == 7
        puts 'Thanks for using Our app!'
        break
      end
      list input
    end
  end

  def list(input)
    case input
    when 1
      list_books
    when 2
      list_people
    when 3
      puts 'Do you want to add a student(1) or a teacher(2)? [input the number]:'
      person_input = gets.chomp.to_i
      add_student if person_input == 1
      add_teacher if person_input == 2
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

  def add_student
    puts 'Enter the name of student:'
    name = gets.chomp
    puts 'Enter the age of the student'
    age = gets.chomp
    puts 'parent permission? [Y/N]:'
    parent_permission = gets.chomp.downcase
    student = Student.new(@class, age, name, parent_permission)
    @people << student
    puts 'Student created successfully'
  end

  def add_teacher
    puts 'Enter the name of the teacher:'
    name = gets.chomp
    puts 'Enter the age of the teacher'
    age = gets.chomp
    puts 'Enter the Specialization:'
    specialization = gets.chomp
    teacher = Teacher.new(specialization, age, name)
    @people << teacher
    puts 'Teacher created successfully'
  end

end

def main
  app = App.new
  app.run
end

main