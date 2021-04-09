class PagesController < ApplicationController
  def home; end

  def search
    # @books = Book.search_by_title_author_gender(params[:query])
     @books_fiction = GoogleBooks.search("#{params[:query]}", {:count => 5, :order_by => 'newest', :country => "US" })

  end
end
