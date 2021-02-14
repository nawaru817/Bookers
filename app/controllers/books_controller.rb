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
    @book = Book.new(book_params)

    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book)

    else
      render 'index'

    end

  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      flash[:upd] = "Book was successfully updated."
      redirect_to book_path(@book)
    else
      render action: :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:del] = "Book was successfully destroyed."
      redirect_to books_path
    else
      render 'index'
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
