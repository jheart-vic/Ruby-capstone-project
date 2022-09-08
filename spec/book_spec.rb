require './book/book'
require './book/create_book'
require './book/list_books'

describe Book do
    before :each do
        publish_date = Date.parse('2019-01-01')
        @book = Book.new('publisher', 'good', publish_date)
    end

    describe '#new' do
        it 'returns a new book object' do
            expect(@book).to be_an_instance_of Book
        end
    end

    it 'Should return true if the book can be archived and false if cannot be archived' do
        expect(@book.can_be_archived?).to be true

        @book.cover_state = 'good'
        @book.publish_date = Date.parse('2010-01-01')
        expect(@book.can_be_archived?).to be false

        @book.cover_state = 'bad'
        expect(@book.can_be_archived?).to be false
    end
end