class PagesController < ApplicationController
  def home; end

  def search
    @books = Book.search_by_title_author_gender(params[:query])
  end
end
