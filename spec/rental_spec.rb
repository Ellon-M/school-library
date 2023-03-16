require_relative '../app/rental'

describe Rental do
  it 'Rental Class' do
    @date = '14/02/23'
    @book = Book.new('The Night Circus', 'Erin Morgenstern')
    @person = Person.new(123, 'Groot', true)
    @rental = Rental.new(@date, @book, @person)
    expect(@rental.person.name).to eql('Groot')
    expect(@rental.person.age).to eql(123)
    expect(@rental.book.title).to eql('The Night Circus')
    expect(@rental.book.author).to eql('Erin Morgenstern')
  end
end
