class BooksController < ApplicationController

  def top
  end

  def index
    @book = Book.new
    @books = Book.all
  end

      def new
      @book = Book.new
      end


  def show
    @book = Book.find(params[:id])
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to books_path(book.id)
  end

  def edit
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
