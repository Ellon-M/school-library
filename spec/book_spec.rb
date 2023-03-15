require_relative '../app/book'
describe Book do
  before :each do
    @new_book = Book.new('Babel, or the Necessity of Violence', 'R. F. Kuang')
  end
  describe "#title" do
      it "returns the correct title" do
        expect(@new_book.title).to eql "Babel, or the Necessity of Violence"
      end
  end
  describe "#author" do
      it "returns the correct author" do
        expect(@new_book.author).to eql "R. F. Kuang"
      end
  end
end
white_check_mark
eyes
raised_hands

require_relative '../app/person'
describe Person do
  before :each do
      @person_1 = Person.new(12, 'Jane', true)
      @person_2 = Person.new(17, 'Claudia', false)
      @person_3 = Person.new(19, 'Miriam', false)
  end
  describe "#age" do
    it "returns the correct age" do
      expect(@person_1.age).to eql 12
      expect(@person_2.age).to eql 17
    end
  end
  describe "#name" do
    it "returns the correct author" do
      expect(@person_1.name).to eql "Jane"
      expect(@person_2.name).to eql "Claudia"
    end
  end
  context 'the class Person' do
    it 'returns true if he can use service for a person wtih age greater than 18' do
      expect(@person_3.can_use_services?).to eq true
    end
    it 'returns false if he can use service for a person with age less than 18' do
      expect(@person_2.can_use_services?).to eq false
    end
    it 'adds into rentals for a new book' do
      new_book = Book.new('House in the Cerulean Sea', 'TJ Klune')
      @person_2.add_rental(new_book, '12/03/2023')
      expect(@person_2.rentals.length).to eq 1
    end
  end
end
