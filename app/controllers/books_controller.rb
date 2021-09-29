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
    if @book.save
        flash[:notice]="You have created book successfully."
      redirect_to book_path(@book)
    else
      @user = current_user
      @book = Book.all
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
      @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice]="Book was successfully destroyed."
      redirect_to books_path
    end
  end

private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
