require_relative '../book'

describe Book do
  context 'Testing the Book Class' do
    newbook = Book.new('Harry Potter', 'JK Rowling')
    it 'Add book' do
      expect(newbook.author).to eq 'JK Rowling'
      expect(newbook.title).to eq 'Harry Potter'
    end

    it 'Add Rental' do
      newbook.add_rental(newbook)
      newbook.add_rental(newbook)
      expect(newbook.rentals.length).to eq 2
    end
  end
end
