class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.new(book_params)

    if @book.save
      redirect_to @book
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to @book
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def authorize_user!
    unless @book.user == current_user
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to @book
    end
  end

  def book_params
    params.require(:book).permit(:title, :author, :isbn, :description, :language, :cover)
  end
end
