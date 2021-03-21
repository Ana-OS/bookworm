class UsersController < ApplicationController

  def profile
    @to_read = current_user.books.where(users_books: {read: false})
    @read = current_user.books.where(users_books: {read: true})
    @wishlist = current_user.books.where(users_books: {wish: true})
  end
end
