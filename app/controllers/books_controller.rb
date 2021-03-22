class BooksController < ApplicationController
  before_action :find_book, only: [ :wish, :read, :to_read, :unlist]
  def index
    # @books = Book.all
    # @books = Book.joins(:genre).where(name: "fiction")
    # binding.pry
    # @books_fiction = Book.joins(:genre).where(genres: {name: "fiction"})
    @books_adventure = Book.joins(:genre).where(genres: {name: "adventure"})
    # binding.pry
    # @books_drama = Book.joins(:genre).where(genres: {name: "drama"})
    @books_crime = Book.joins(:genre).where(genres: {name: "crime"})
    @books_black_lives_matter = Book.joins(:genre).where(genres: {name: "black_lives_matter"})
    @books_fiction = GoogleBooks.search("black lives matter", {:count => 15, :order_by => 'newest', :country => "us"})
  end

  def show
    @books_fiction = GoogleBooks.search("black lives matter", {:count => 15, :order_by => 'newest', :country => "us"})
    @books_fiction.each do |book|
      @book = book
    end
  end

  def create
  @books_fiction.each do |book|
   @book = Book.create(title: book.title, author: book.authors, description: book.description, genre: fiction, photo_url: book.image_link(:zoom => 1), preview_link: book.preview_link, buy_link: book.sale_info['buyLink'])
   end
  end

  def to_read
    @user_book = UsersBook.find_by(book: @book, user: current_user)
    # se houver uma relação entre o user e o book
    if @user_book
      #faz um apdate ao valor de read:
      @user_book.update(read: false)
      redirect_to book_path(@book)
     # se essa relação ainda não existir então criamos uma nova
    else
      @user_book = UsersBook.new(book: @book, user: current_user, read: false)
      @user_book.save
      redirect_to book_path(@book)
    end
  end

  def read
    @user_book = UsersBook.find_by(book: @book, user: current_user)
    # se houver uma relação entre o user e o book
    if @user_book
      @user_book.update(read: true)
      redirect_to book_path(@book)

    else
      @user_book = UsersBook.new(book: @book, user: current_user, read: true)
      @user_book.save
      redirect_to book_path(@book)
    end
  end

  def wish
    @user_book = UsersBook.find_by(book: @book, user: current_user)
    if @user_book
      @user_book.update(wish: true)
      redirect_to book_path(@book)
    else
      @user_book = UsersBook.new(book: @book, user: current_user, wish: true)
      @user_book.save
      redirect_to book_path(@book)
    end
  end

  def unlist
    @user_book = UsersBook.find_by(book: @book, user: current_user)
    @user_book.destroy
    redirect_to profile_users_path
  end


  private

  def find_book
    @book = Book.find(params[:id])
  end

  def get_books
    @books_fiction = GoogleBooks.search("black lives matter", {:count => 15, :order_by => 'newest', :country => "us"})
  end
end

