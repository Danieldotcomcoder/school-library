require_relative '../rental'
require_relative '../book'
require_relative '../person'

describe Rental do
  context 'Testing the Rental Class'
  newbook = Book.new('Bookname', 'Bookauthor')
  newperson = Person.new(id: 13, age: 21, name: 'danny', parent_permission: true)
  newrental = Rental.new('2/2/2022', newbook, newperson)

  it ' test adding new rental' do
    expect(newrental.person).to eq newperson
    expect(newrental.book).to eq newbook
    expect(newrental.date).to eq '2/2/2022'
  end
end
