class BooksController < ApplicationController

  def show
      @book = Book.find(params[:id])
      @user = book.user
  end

  def index
      @user = current_user
      @books = Book.all
      @book = Book.new
  end

  def create
      @book = Book.new(book_params)
      @book.user_id = current_user.id
      @book.save
      redirect_to books_path
  end
  
  def edit
  
  def update
  end

  def destroy
      @book = Book.find(params[:id])
      @book.destroy
      redirect_to books_path
  end

private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
