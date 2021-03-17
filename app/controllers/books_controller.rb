class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    @books = Book.all
    # １. データを新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    @book.save
    # サクセスメッセージ
    if @book.save
    flash[:notice] = "Book was successfully created."

    # ３. トップ画面へリダイレクト
    redirect_to book_path(@book.id)

    else
      render "index"
    end

  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)


  # サクセスメッセージ
    if @book.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(@book)
    else
      render 'edit'

    end

  end

  def destroy
    @book = Book.find(params[:id])
    
    
  # サクセスメッセージ
    if @book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path
    end

  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
