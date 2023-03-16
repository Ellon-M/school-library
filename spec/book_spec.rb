require_relative '../app/book'
describe Book do
  before :each do
    @new_book = Book.new('Babel, or the Necessity of Violence', 'R. F. Kuang')
  end
  describe '#title' do
    it 'returns the correct title' do
      expect(@new_book.title).to eql 'Babel, or the Necessity of Violence'
    end
  end
  describe '#author' do
    it 'returns the correct author' do
      expect(@new_book.author).to eql 'R. F. Kuang'
    end
  end
end
