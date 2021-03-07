class AddColumnToUsersGenres < ActiveRecord::Migration[6.0]
  def change
    add_reference :users_genres, :user, foreign_key: true
    add_reference :users_genres, :genre, foreign_key: true
  end
end
