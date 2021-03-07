class CreateUsersBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :users_books do |t|

      t.timestamps
    end
  end
end
