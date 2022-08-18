class UsersController < ApplicationController

  def show
    @user=User.find(params[:id])
    @books=@user.books
    @book=Book.new
    
  end

  def create
    @user=User.new(book_params)
    @user.save
    redirect_to user_path(current_user.id)
  end

  def edit
  end

    private

  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end

end
