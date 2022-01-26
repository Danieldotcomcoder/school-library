require './corrector'
require './rental'

class Person
  attr_reader :id
  attr_accessor :name, :age, :rental

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end

  def of_age?
    @age >= 18
  end
  private :of_age?
  def can_use_services?
    of_age? || parent_permission
  end

  def validate_name
    @corrector.correct_name(@name)
  end
end
