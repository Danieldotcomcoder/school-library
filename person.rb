# rubocop: disable Style/OptionalBooleanParameter

require './corrector'
require './rental'

class Person
  attr_accessor :name, :age, :parent_permission, :rentals
  attr_reader :id

  def initialize(id:, age:, name: 'Unknown', parent_permission: true)
    @id = id
    @id = Random.rand(1..1000) if @id.nil?
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
  end


  def add_rentals(person)
    @rentals.push(person)
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
# rubocop: enable Style/OptionalBooleanParameter
