class BooksController < ApplicationController
  before_action :find_book, only: [:show]
  def index
    # @books = Book.all
    # @books = Book.joins(:genre).where(name: "fiction")
    # binding.pry
    @books_fiction = Book.joins(:genre).where(genres: {name: "fiction"})
    @books_adventure = Book.joins(:genre).where(genres: {name: "adventure"})
    # binding.pry
    # @books_drama = Book.joins(:genre).where(genres: {name: "drama"})
    @books_crime = Book.joins(:genre).where(genres: {name: "crime"})
    @books_black_lives_matter = Book.joins(:genre).where(genres: {name: "black_lives_matter"})

  end

  def show
    @reviews = @book.reviews
    @review = Review.find_by(book: @book, user: current_user) || Review.new
  end


  private

  def find_book
    @book = Book.find(params[:id])

  end
end

