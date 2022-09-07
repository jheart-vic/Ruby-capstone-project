require './book'
require 'date'
describe Book do
  context 'test book class' do
    book = Book.new('Victor', 'Good', '2002/10/10')
    it 'Book publisher should return Victor' do
      expect(book.publisher).to eq 'Victor'
    end
    it 'Book cover_state should return Good' do
      expect(book.cover_state).to eq 'Good'
    end
    it 'Book publish_date should return 2002/10/10' do
      expect(book.publish_date).to eq '2002/10/10'
    end
    it 'Book can_be_archived should return true' do
      book2 = Book.new('Victor', 'Bad', '2002/10/10')
      expect(book2.send(:can_be_archived?)).to be true
    end
    it 'Book can_be_archived should return false' do
      book2 = Book.new('Victor', 'Good', '2015/10/10')
      expect(book2.send(:can_be_archived?)).to be false
    end
    it 'Book can_be_archived should return true' do
      book2 = Book.new('Victor', 'Bad', '2002/10/10')
      expect(book2.move_to_archive).to be true
    end
  end
end
