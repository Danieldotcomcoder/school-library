require 'json'
require_relative 'student'
require_relative 'rental'
require_relative 'book'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'person'
module Writedata
  def save_books
    jsonarray = []
    @books.each do |book|
      jsonarray.push({ title: book.title, author: book.author })
    end
    open('bookslist.json', 'w') { |book| book << JSON.generate(jsonarray) }
  end

  def load_books
    filename = 'bookslist.json'
    if File.exist? filename
      JSON.parse(File.read(filename)).map do |book|
        Book.new(book['title'], book['author'])
      end
    else
      []
    end
  end

  def save_person
    jsonarray = []
    @people.each do |person|
      if person.is_a?(Student)
        jsonarray.push({ type: 'student', id: person.id, name: person.name, age: person.age,
                         permission: person.parent_permission, classroom: person.classroom })
      else
        jsonarray.push({ type: 'teacher', id: person.id, name: person.name, age: person.age,
                         specialization: person.specialization })
      end
    end
    open('peoplelist.json', 'w') { |person| person << JSON.generate(jsonarray) }
  end

  def load_people
    filename = 'peoplelist.json'
    if File.exist? filename
      JSON.parse(File.read(filename)).map do |person|
        if person['type'] == 'student'

          Student.new(age: person['age'], id: person['id'], name: person['name'],
                      parent_permission: person['permission'], classroom: person['classroom'])

        else
          Teacher.new(age: person['age'], id: person['id'], name: person['name'],
                      specialization: person['specialization'])

        end
      end
    else
      []
    end
  end

 

  def save_data
    save_books unless @books.empty?
    save_person unless @people.empty?
    save_rentals unless @rentals.empty?
  end
end
