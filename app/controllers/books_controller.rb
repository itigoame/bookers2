class BooksController < ApplicationController
  
  before_action :correct_user, only: [:edit, :update]

  def show
    @book=Book.new
    @bookshow=Book.find(params[:id])
    @user=@bookshow.user
    @userone=current_user
  end

  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    @books=Book.all
    @user=current_user
    if @book.save
      flash[:notice]="You have created book successfully."
      redirect_to book_path(@book.id)
    else
      render :index
    end

  end

  def index
    @book=Book.new
    @books=Book.all
    @user=current_user
  end

  def edit
    @bookshow=Book.find(params[:id])
  end

  def update
    @bookshow=Book.find(params[:id])
    if @bookshow.update(book_params)
      flash[:notice]="You have updated book successfully."
      redirect_to book_path(@bookshow.id)
    else
      render :edit
    end
  end

  def destroy
    bookshow=Book.find(params[:id])
    bookshow.destroy
    redirect_to books_path

  end

private

  def book_params
    params.require(:book).permit(:title ,:body)
  end

end