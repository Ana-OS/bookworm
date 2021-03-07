class AddColumnToUsersBooks < ActiveRecord::Migration[6.0]
  def change
    add_reference :users_books, :user, foreign_key: true
    add_reference :users_books, :book, foreign_key: true
  end
end
