class AddColumnToBooks < ActiveRecord::Migration[6.0]
  def change
    add_reference :books, :genre, foreign_key: true
  end
end
