require_relative '../person'

describe Person do
  context 'Testing the Person Class'
  newperson = Person.new(id: 1, age: 27, name: 'danny', parent_permission: true)
  it 'Add Person' do
    expect(newperson.id).to eq 1
    expect(newperson.age).to eq 27
    expect(newperson.name).to eq 'danny'
    expect(newperson.parent_permission).to eq true
  end

  it 'Add Rentals' do
    newperson.add_rentals(newperson)
    expect(newperson.rentals.length).to eq 1
  end

  it 'can use services should return true' do
    expect(newperson.can_use_services?).to eq true
  end

  it 'validate name should capitalize first letter of name' do
    expect(newperson.validate_name).to eq 'Danny'
  end
end
