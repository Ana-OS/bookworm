class AddColumnsToUsersBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :users_books, :wish, :boolean
    add_column :users_books, :challenges, :boolean
  end
end
