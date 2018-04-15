class BooksController < ApplicationController
  def top

  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end



  def edit
    @book = Book.find(params[:id])
  end

  def update
  	book = Book.find(params[:id])
  	book.update(book_params)
  	redirect_to books_path
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path
  end

  def create
   # ストロングパラメーターを使用
    post = Book.new(book_params)
    # DBへ保存する
    post.save
   # トップ画面へリダイレクト
    redirect_to books_path
  end

  private
 
  def book_params
  params.require(:book).permit(:title, :body)
  end
end
