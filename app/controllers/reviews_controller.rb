class ReviewsController < ApplicationController
  before_action :find_review, only: [:show, :edit, :update, :delete]
  def index
    @reviews = Review.all
  end

  def show;end

  def new
    @book = Book.find(params[:book_id])
    @review = Review.new
  end

  def update
    @book = Book.find(params[:book_id])
    if @review.update(review_params)
      redirect_to book_path(@book)
    else
      @review = Review.new
    end
  end

  def create
    @book = Book.find(params[:book_id])
    @review = Review.new(review_params)
    @review.book = @book
    @review.user = current_user
    if @review.save!
      redirect_to book_path(@book)
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def find_review
    @review = Review.find(params[:id])
  end
end
