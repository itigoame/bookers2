class BooksController < ApplicationController

  def show
    @book=Book.new
    @books=Book.find(params[:id])
  end

  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    @book.save
    redirect_to user_path(current_user.id)
  end

  def index
    @book=Book.new
    @books=Book.all
  end

  def edit
  end

private

  def book_params
    params.require(:book).permit(:title ,:body)
  end

end