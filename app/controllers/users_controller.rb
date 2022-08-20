class UsersController < ApplicationController

  def show
    @user=User.find(params[:id])
    @bookshow=@user.books
    @book=Book.new
  end

  def index
    @users=User.all
    @user=current_user
    @book=Book.new
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    user=User.find(params[:id])
  end
    private

  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end

end
