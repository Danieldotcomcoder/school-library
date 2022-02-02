require_relative '../teacher'

describe Teacher do
  context 'Testing the Teacher Class'
  newteacher = Teacher.new(id: 221, age: 30, name: 'Chris', specialization: 'Biology')
  it 'Add Person' do
    expect(newteacher.id).to eq 221
    expect(newteacher.age).to eq 30
    expect(newteacher.name).to eq 'Chris'
    expect(newteacher.specialization).to eq 'Biology'
  end

  it 'Can use service should always return true' do
    expect(newteacher.can_use_services?).to eq true
  end
end
