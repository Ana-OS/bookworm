class CreateUsersGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :users_genres do |t|
      t.timestamps
    end
  end
end
