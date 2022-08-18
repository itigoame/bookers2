class Book < ApplicationRecord

    belongs_to :user

    def index
      @book = Book.new
      @books = Books.all
    end

    def create
      book = Book.new(book_params)
      book.save
      redirect_to "/"
    end

    private

    def book_params
      params.require(:book).permit(:title,:body)
    end

end
