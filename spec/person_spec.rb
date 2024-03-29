require_relative '../app/person'
require_relative '../app/rental'

describe Person do
  before :each do
    @person_a = Person.new(12, 'Jane', true)
    @person_b = Person.new(17, 'Claudia', false)
    @person_c = Person.new(19, 'Miriam', false)
  end

  describe '#age' do
    it 'returns the correct age' do
      expect(@person_a.age).to eql 12
      expect(@person_b.age).to eql 17
    end
  end
  describe '#name' do
    it 'returns the correct author' do
      expect(@person_a.name).to eql 'Jane'
      expect(@person_b.name).to eql 'Claudia'
    end
  end

  context 'the class Person' do
    it 'returns true if he can use service for a person wtih age greater than 18' do
      expect(@person_c.can_use_services?).to eq true
    end

    it 'returns false if he can use service for a person with age less than 18' do
      expect(@person_b.can_use_services?).to eq false
    end

    it 'adds into rentals for a new book' do
      new_book = Book.new('House in the Cerulean Sea', 'TJ Klune')
      @person_b.add_rental(new_book, '12/03/2023')
      expect(@person_b.rentals.length).to eq 1
    end
  end
end
