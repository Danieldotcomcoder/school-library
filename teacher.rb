# rubocop: disable Style/OptionalBooleanParameter

require './person'

class Teacher < Person
  attr_reader :specialization

  def initialize(age:, specialization:, id: nil, name: 'Unknown', parent_permission: true)
    super(id: id, name: name, age: age, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
# rubocop: enable Style/OptionalBooleanParameter
