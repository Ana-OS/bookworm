class AddAnotherColumnToUsersBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :users_books, :read, :boolean
  end
end
